library verilog;
use verilog.vl_types.all;
entity REG32_LD_CL_INC_DEC_SL_SR is
    port(
        LD              : in     vl_logic;
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        INC             : in     vl_logic;
        DEC             : in     vl_logic;
        C0              : in     vl_logic;
        E0              : in     vl_logic;
        SL              : in     vl_logic;
        IL              : in     vl_logic;
        SR              : in     vl_logic;
        IR              : in     vl_logic;
        I               : in     vl_logic_vector(31 downto 0);
        C32             : out    vl_logic;
        E32             : out    vl_logic;
        A               : out    vl_logic_vector(31 downto 0)
    );
end REG32_LD_CL_INC_DEC_SL_SR;
