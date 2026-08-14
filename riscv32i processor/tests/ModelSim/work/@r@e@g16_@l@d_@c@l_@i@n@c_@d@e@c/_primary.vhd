library verilog;
use verilog.vl_types.all;
entity REG16_LD_CL_INC_DEC is
    port(
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        LD              : in     vl_logic;
        INC             : in     vl_logic;
        DEC             : in     vl_logic;
        C0              : in     vl_logic;
        E0              : in     vl_logic;
        I               : in     vl_logic_vector(15 downto 0);
        C16             : out    vl_logic;
        E16             : out    vl_logic;
        A               : out    vl_logic_vector(15 downto 0)
    );
end REG16_LD_CL_INC_DEC;
