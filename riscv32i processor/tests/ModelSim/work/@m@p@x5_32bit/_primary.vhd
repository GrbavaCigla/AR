library verilog;
use verilog.vl_types.all;
entity MPX5_32bit is
    port(
        data0x          : in     vl_logic_vector(31 downto 0);
        data1x          : in     vl_logic_vector(31 downto 0);
        data2x          : in     vl_logic_vector(31 downto 0);
        data3x          : in     vl_logic_vector(31 downto 0);
        data4x          : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end MPX5_32bit;
