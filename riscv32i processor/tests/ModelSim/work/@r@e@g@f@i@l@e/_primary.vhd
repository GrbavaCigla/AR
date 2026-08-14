library verilog;
use verilog.vl_types.all;
entity REGFILE is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        REGWRITE        : in     vl_logic;
        RD              : in     vl_logic_vector(4 downto 0);
        RS1             : in     vl_logic_vector(4 downto 0);
        RS2             : in     vl_logic_vector(4 downto 0);
        WRITEDATA       : in     vl_logic_vector(31 downto 0);
        RS1DATA         : out    vl_logic_vector(31 downto 0);
        RS2DATA         : out    vl_logic_vector(31 downto 0)
    );
end REGFILE;
