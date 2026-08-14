library verilog;
use verilog.vl_types.all;
entity CMP1 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Gi_1            : in     vl_logic;
        Ei_1            : in     vl_logic;
        Li_1            : in     vl_logic;
        G               : out    vl_logic;
        E               : out    vl_logic;
        L               : out    vl_logic
    );
end CMP1;
