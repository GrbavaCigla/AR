library verilog;
use verilog.vl_types.all;
entity MPX16_32BIT is
    port(
        data0x          : in     vl_logic_vector(31 downto 0);
        data1x          : in     vl_logic_vector(31 downto 0);
        data2x          : in     vl_logic_vector(31 downto 0);
        data3x          : in     vl_logic_vector(31 downto 0);
        data4x          : in     vl_logic_vector(31 downto 0);
        data5x          : in     vl_logic_vector(31 downto 0);
        data6x          : in     vl_logic_vector(31 downto 0);
        data7x          : in     vl_logic_vector(31 downto 0);
        data8x          : in     vl_logic_vector(31 downto 0);
        data9x          : in     vl_logic_vector(31 downto 0);
        data10x         : in     vl_logic_vector(31 downto 0);
        data11x         : in     vl_logic_vector(31 downto 0);
        data12x         : in     vl_logic_vector(31 downto 0);
        data13x         : in     vl_logic_vector(31 downto 0);
        data14x         : in     vl_logic_vector(31 downto 0);
        data15x         : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end MPX16_32BIT;
