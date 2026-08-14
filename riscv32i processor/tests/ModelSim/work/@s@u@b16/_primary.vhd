library verilog;
use verilog.vl_types.all;
entity SUB16 is
    port(
        E_0             : in     vl_logic;
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        E               : out    vl_logic;
        \OUT\           : out    vl_logic_vector(15 downto 0)
    );
end SUB16;
