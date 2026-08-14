library verilog;
use verilog.vl_types.all;
entity REG8_LD_CL is
    port(
        CL              : in     vl_logic;
        clk             : in     vl_logic;
        LD              : in     vl_logic;
        I               : in     vl_logic_vector(7 downto 0);
        A               : out    vl_logic_vector(7 downto 0)
    );
end REG8_LD_CL;
