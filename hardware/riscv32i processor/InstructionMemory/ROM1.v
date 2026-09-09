module ROM1(
    address,
    clock,
    q
);

    input  [9:0]  address;
    input         clock;
    output [31:0] q;

    reg [31:0] mem [0:1023];
    reg [31:0] q_reg;

    initial begin
    $readmemh("C:/Users/Aleksandar/Documents/GitHub/AR/riscv32i processor/InstructionMemory/InicializationData.hex", mem);
end

    always @(posedge clock) begin
        q_reg <= mem[address];
    end

    assign q = q_reg;

endmodule