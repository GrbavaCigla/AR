library verilog;
use verilog.vl_types.all;
entity MPX2_16BIT is
    port(
        E               : in     vl_logic;
        S               : in     vl_logic;
        I0              : in     vl_logic_vector(15 downto 0);
        I1              : in     vl_logic_vector(15 downto 0);
        D               : out    vl_logic_vector(15 downto 0)
    );
end MPX2_16BIT;
