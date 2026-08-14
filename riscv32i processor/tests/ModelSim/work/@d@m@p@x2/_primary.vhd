library verilog;
use verilog.vl_types.all;
entity DMPX2 is
    port(
        E               : in     vl_logic;
        I0              : in     vl_logic;
        S               : in     vl_logic;
        D0              : out    vl_logic;
        D1              : out    vl_logic
    );
end DMPX2;
