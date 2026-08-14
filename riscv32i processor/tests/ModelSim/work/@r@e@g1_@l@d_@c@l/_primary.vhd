library verilog;
use verilog.vl_types.all;
entity REG1_LD_CL is
    port(
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        LD              : in     vl_logic;
        I               : in     vl_logic;
        A               : out    vl_logic
    );
end REG1_LD_CL;
