library verilog;
use verilog.vl_types.all;
entity XOR2_32BIT is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        C               : out    vl_logic_vector(31 downto 0)
    );
end XOR2_32BIT;
