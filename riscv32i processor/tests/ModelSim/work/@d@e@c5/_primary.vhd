library verilog;
use verilog.vl_types.all;
entity DEC5 is
    port(
        E               : in     vl_logic;
        \IN\            : in     vl_logic_vector(4 downto 0);
        \OUT\           : out    vl_logic_vector(31 downto 0)
    );
end DEC5;
