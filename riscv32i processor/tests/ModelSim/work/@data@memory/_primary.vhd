library verilog;
use verilog.vl_types.all;
entity DataMemory is
    port(
        CLK             : in     vl_logic;
        MemWrite        : in     vl_logic;
        RESET           : in     vl_logic;
        MemRead         : in     vl_logic;
        ADDRESS         : in     vl_logic_vector(31 downto 0);
        WRITEDATA       : in     vl_logic_vector(31 downto 0);
        READDATA        : out    vl_logic_vector(31 downto 0)
    );
end DataMemory;
