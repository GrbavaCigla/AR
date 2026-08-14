library verilog;
use verilog.vl_types.all;
entity OR32 is
    port(
        \IN\            : in     vl_logic_vector(31 downto 0);
        \OUT\           : out    vl_logic
    );
end OR32;
