library verilog;
use verilog.vl_types.all;
entity CMP32 is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        G               : out    vl_logic;
        E               : out    vl_logic;
        L               : out    vl_logic
    );
end CMP32;
