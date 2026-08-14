library verilog;
use verilog.vl_types.all;
entity SR5_32BIT is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(4 downto 0);
        X               : out    vl_logic_vector(31 downto 0)
    );
end SR5_32BIT;
