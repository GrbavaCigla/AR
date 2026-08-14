library verilog;
use verilog.vl_types.all;
entity CMP4 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        G               : out    vl_logic;
        E               : out    vl_logic;
        L               : out    vl_logic
    );
end CMP4;
