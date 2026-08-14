library verilog;
use verilog.vl_types.all;
entity BranchDecoder is
    port(
        z               : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        result          : in     vl_logic_vector(31 downto 0);
        BEQ             : out    vl_logic;
        BNE             : out    vl_logic;
        BLT             : out    vl_logic;
        BGE             : out    vl_logic;
        BLTU            : out    vl_logic;
        BGEU            : out    vl_logic
    );
end BranchDecoder;
