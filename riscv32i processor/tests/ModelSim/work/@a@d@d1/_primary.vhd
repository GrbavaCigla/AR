library verilog;
use verilog.vl_types.all;
entity ADD1 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C_0             : in     vl_logic;
        C               : out    vl_logic;
        \OUT\           : out    vl_logic
    );
end ADD1;
