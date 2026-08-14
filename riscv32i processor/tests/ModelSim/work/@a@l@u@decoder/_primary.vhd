library verilog;
use verilog.vl_types.all;
entity ALUDecoder is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7          : in     vl_logic_vector(5 downto 5);
        ALUControl      : out    vl_logic_vector(3 downto 0)
    );
end ALUDecoder;
