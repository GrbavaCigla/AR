library verilog;
use verilog.vl_types.all;
entity SL_32BIT is
    port(
        C0              : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        B               : out    vl_logic_vector(31 downto 0)
    );
end SL_32BIT;
