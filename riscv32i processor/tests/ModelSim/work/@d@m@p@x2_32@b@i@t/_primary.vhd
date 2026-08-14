library verilog;
use verilog.vl_types.all;
entity DMPX2_32BIT is
    port(
        E               : in     vl_logic;
        S               : in     vl_logic;
        I               : in     vl_logic_vector(31 downto 0);
        D0              : out    vl_logic_vector(31 downto 0);
        D1              : out    vl_logic_vector(31 downto 0)
    );
end DMPX2_32BIT;
