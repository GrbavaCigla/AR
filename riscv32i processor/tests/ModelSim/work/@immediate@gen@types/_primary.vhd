library verilog;
use verilog.vl_types.all;
entity ImmediateGenTypes is
    port(
        INSTR           : in     vl_logic_vector(31 downto 0);
        B_TYPE          : out    vl_logic_vector(31 downto 0);
        I_TYPE          : out    vl_logic_vector(31 downto 0);
        J_TYPE          : out    vl_logic_vector(31 downto 0);
        S_TYPE          : out    vl_logic_vector(31 downto 0);
        U_TYPE          : out    vl_logic_vector(31 downto 0)
    );
end ImmediateGenTypes;
