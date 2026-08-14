library verilog;
use verilog.vl_types.all;
entity OR16 is
    port(
        \IN\            : in     vl_logic_vector(15 downto 0);
        \OUT\           : out    vl_logic
    );
end OR16;
