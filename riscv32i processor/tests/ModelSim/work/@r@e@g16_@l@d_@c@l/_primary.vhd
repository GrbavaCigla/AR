library verilog;
use verilog.vl_types.all;
entity REG16_LD_CL is
    port(
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        LD              : in     vl_logic;
        I               : in     vl_logic_vector(15 downto 0);
        A               : out    vl_logic_vector(15 downto 0)
    );
end REG16_LD_CL;
