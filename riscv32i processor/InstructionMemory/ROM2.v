module ROM2(
    aclr,
    address,
    clock,
    rden,
    q
);

    input         aclr;
    input  [9:0]  address;
    input         clock;
    input         rden;
    output [31:0] q;

    reg [31:0] mem [0:1023];
    reg [31:0] q_reg;

    initial begin
        $readmemh(
            "InstructionMemory/InicializationData.hex",
            mem
        );
    end

    always @(posedge clock) begin
        if (aclr)
            q_reg <= 32'b0;
        else if (rden)
            q_reg <= mem[address];
    end

    assign q = q_reg;

endmodule