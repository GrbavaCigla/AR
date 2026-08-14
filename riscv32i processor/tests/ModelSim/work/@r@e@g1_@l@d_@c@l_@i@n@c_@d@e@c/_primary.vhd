library verilog;
use verilog.vl_types.all;
entity REG1_LD_CL_INC_DEC is
    port(
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        LD              : in     vl_logic;
        I               : in     vl_logic;
        Ci              : in     vl_logic;
        Ei              : in     vl_logic;
        INC             : in     vl_logic;
        DEC             : in     vl_logic;
        A               : out    vl_logic;
        Ci_1            : out    vl_logic;
        Ei_1            : out    vl_logic
    );
end REG1_LD_CL_INC_DEC;
