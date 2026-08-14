library verilog;
use verilog.vl_types.all;
entity ImmediateGenerator is
    port(
        IMM_SRC         : in     vl_logic_vector(2 downto 0);
        INSTRUCTION     : in     vl_logic_vector(31 downto 0);
        IMM_OUT         : out    vl_logic_vector(31 downto 0)
    );
end ImmediateGenerator;
