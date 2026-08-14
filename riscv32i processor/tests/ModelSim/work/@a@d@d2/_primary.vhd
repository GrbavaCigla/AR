library verilog;
use verilog.vl_types.all;
entity ADD2 is
    port(
        C_0             : in     vl_logic;
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        C               : out    vl_logic;
        \OUT\           : out    vl_logic_vector(1 downto 0)
    );
end ADD2;
