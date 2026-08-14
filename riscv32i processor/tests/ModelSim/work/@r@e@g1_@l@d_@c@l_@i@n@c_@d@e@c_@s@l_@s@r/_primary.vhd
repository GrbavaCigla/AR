library verilog;
use verilog.vl_types.all;
entity REG1_LD_CL_INC_DEC_SL_SR is
    port(
        LD              : in     vl_logic;
        I               : in     vl_logic;
        CL              : in     vl_logic;
        INC             : in     vl_logic;
        Ci              : in     vl_logic;
        SL              : in     vl_logic;
        IL              : in     vl_logic;
        SR              : in     vl_logic;
        IR              : in     vl_logic;
        clk             : in     vl_logic;
        Ei              : in     vl_logic;
        DEC             : in     vl_logic;
        A               : out    vl_logic;
        Ci_1            : out    vl_logic;
        Ei_1            : out    vl_logic
    );
end REG1_LD_CL_INC_DEC_SL_SR;
