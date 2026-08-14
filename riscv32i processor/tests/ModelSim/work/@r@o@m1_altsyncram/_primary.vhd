library verilog;
use verilog.vl_types.all;
entity ROM1_altsyncram is
    port(
        address_a       : in     vl_logic_vector(9 downto 0);
        clock0          : in     vl_logic;
        q_a             : out    vl_logic_vector(31 downto 0)
    );
end ROM1_altsyncram;
