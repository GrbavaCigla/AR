#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    if (argc < 4) {
        fprintf(stderr, "Usage: %s <input.bin> <output.mif> <depth>\n", argv[0]);
        return 1;
    }

    const char* bin_path = argv[1];
    const char* mif_path = argv[2];
    size_t depth = (size_t)strtoul(argv[3], NULL, 10);

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
    uint8_t* buffer = (uint8_t*)calloc(bytes_read + 4, 1);
    if (!buffer) {
        fclose(bin_file);
        return 1;
    }

    fread(buffer, 1, bytes_read, bin_file);
    fclose(bin_file);

    FILE* mif_file = fopen(mif_path, "w");
    if (!mif_file) {
        perror("Failed to create MIF file");
        free(buffer);
        return 1;
    }

    fprintf(mif_file, "WIDTH=32;\n");
    fprintf(mif_file, "DEPTH=%zu;\n", depth);
    fprintf(mif_file, "ADDRESS_RADIX=HEX;\n");
    fprintf(mif_file, "DATA_RADIX=HEX;\n\n");
    fprintf(mif_file, "CONTENT BEGIN\n");

    size_t word_count = (bytes_read + 3) / 4;

    for (size_t i = 0; i < word_count; i++) {
        uint32_t b0 = buffer[i * 4 + 0];
        uint32_t b1 = buffer[i * 4 + 1];
        uint32_t b2 = buffer[i * 4 + 2];
        uint32_t b3 = buffer[i * 4 + 3];

        uint32_t instruction = b0 | (b1 << 8) | (b2 << 16) | (b3 << 24);
        fprintf(mif_file, "    %04ZX : %08X;\n", i, instruction);
    }

    if (word_count < depth) {
        if (word_count == depth - 1)
            fprintf(mif_file, "    %04ZX : 00000013;\n", word_count);
        else
            fprintf(mif_file, "    [%04ZX..%04ZX] : 00000013;\n", word_count, depth - 1);
    }

    fprintf(mif_file, "END;\n");

    fclose(mif_file);
    free(buffer);
    return 0;
}