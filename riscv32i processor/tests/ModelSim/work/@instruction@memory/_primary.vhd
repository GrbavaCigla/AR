library verilog;
use verilog.vl_types.all;
entity InstructionMemory is
    port(
        CLK             : in     vl_logic;
        ADDRESS         : in     vl_logic_vector(31 downto 0);
        READDATA        : out    vl_logic_vector(31 downto 0)
    );
end InstructionMemory;
