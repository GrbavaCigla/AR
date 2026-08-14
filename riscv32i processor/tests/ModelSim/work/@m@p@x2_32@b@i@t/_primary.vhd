library verilog;
use verilog.vl_types.all;
entity MPX2_32BIT is
    port(
        E               : in     vl_logic;
        S               : in     vl_logic;
        I0              : in     vl_logic_vector(31 downto 0);
        I1              : in     vl_logic_vector(31 downto 0);
        D               : out    vl_logic_vector(31 downto 0)
    );
end MPX2_32BIT;
