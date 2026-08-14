library verilog;
use verilog.vl_types.all;
entity SRA_SRL_32BIT is
    port(
        MODE            : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(4 downto 0);
        X               : out    vl_logic_vector(31 downto 0)
    );
end SRA_SRL_32BIT;
