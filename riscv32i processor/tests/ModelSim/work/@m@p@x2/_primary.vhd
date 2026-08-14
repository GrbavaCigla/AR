library verilog;
use verilog.vl_types.all;
entity MPX2 is
    port(
        E               : in     vl_logic;
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        S               : in     vl_logic;
        D               : out    vl_logic
    );
end MPX2;
