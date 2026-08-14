library verilog;
use verilog.vl_types.all;
entity REG32_LD_CL is
    port(
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        LD              : in     vl_logic;
        I               : in     vl_logic_vector(31 downto 0);
        A               : out    vl_logic_vector(31 downto 0)
    );
end REG32_LD_CL;
