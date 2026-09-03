#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    if (argc < 4) {
        fprintf(stderr, "Usage: %s <input.bin> <output.v> <depth>\n", argv[0]);
        return 1;
    }

    const char* bin_path = argv[1];
    const char* verilog_path = argv[2];
    size_t depth = (size_t)strtoul(argv[3], NULL, 10);

    if (depth == 0 || depth > 1024) {
        fprintf(stderr, "Error: depth must be between 1 and 1024\n");
        return 1;
    }

    FILE* bin_file = fopen(bin_path, "rb");
    if (!bin_file) {
        perror("Failed to open binary file");
        return 1;
    }

    fseek(bin_file, 0, SEEK_END);
    long file_size = ftell(bin_file);
    fseek(bin_file, 0, SEEK_SET);

    if (file_size < 0) {
        fclose(bin_file);
        return 1;
    }

    size_t bytes_read = (size_t)file_size;

    if (bytes_read > depth * 4) {
        fprintf(stderr,
                "Error: binary file is too large for ROM depth "
                "(%zu bytes > %zu bytes)\n",
                bytes_read,
                depth * 4);
        fclose(bin_file);
        return 1;
    }

    uint8_t* buffer = (uint8_t*)calloc(bytes_read + 4, 1);
    if (!buffer) {
        fclose(bin_file);
        return 1;
    }

    if (fread(buffer, 1, bytes_read, bin_file) != bytes_read) {
        fprintf(stderr, "Failed to read binary file\n");
        fclose(bin_file);
        free(buffer);
        return 1;
    }

    fclose(bin_file);

    FILE* verilog_file = fopen(verilog_path, "w");
    if (!verilog_file) {
        perror("Failed to create Verilog file");
        free(buffer);
        return 1;
    }

    fprintf(verilog_file,
        "module ROM_CPU3 (\n"
        "    input  wire [9:0]  addr,\n"
        "    output reg  [31:0] data\n"
        ");\n\n");

    fprintf(verilog_file,
        "always @(*) begin\n"
        "    case (addr)\n");

    size_t word_count = (bytes_read + 3) / 4;

    for (size_t i = 0; i < word_count; i++) {
        uint32_t b0 = buffer[i * 4 + 0];
        uint32_t b1 = buffer[i * 4 + 1];
        uint32_t b2 = buffer[i * 4 + 2];
        uint32_t b3 = buffer[i * 4 + 3];

        uint32_t instruction =
            b0 |
            (b1 << 8) |
            (b2 << 16) |
            (b3 << 24);

        fprintf(verilog_file,
                "        10'h%03zX: data = 32'h%08X;\n",
                i,
                instruction);
    }

    fprintf(verilog_file, "\n");

    // if (word_count < depth) {
    //     for (size_t i = word_count; i < depth; i++) {
    //         fprintf(verilog_file,
    //                 "        10'h%03zX: data = 32'h00000013;\n",
    //                 i);
    //     }
    // }

    fprintf(verilog_file,
        "        default: data = 32'h00000013;\n"
        "    endcase\n"
        "end\n\n"
        "endmodule\n");

    fclose(verilog_file);
    free(buffer);

    return 0;
}
