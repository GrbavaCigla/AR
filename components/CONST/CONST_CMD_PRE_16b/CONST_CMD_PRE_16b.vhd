LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY CONST_CMD_PRE_16b IS
    PORT
    (
        result : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END CONST_CMD_PRE_16b;

ARCHITECTURE SYN OF const_cmd_pre_16b IS
    SIGNAL sub_wire0 : STD_LOGIC_VECTOR (15 DOWNTO 0);

    COMPONENT lpm_constant
    GENERIC (
        lpm_cvalue : NATURAL;
        lpm_hint   : STRING;
        lpm_type   : STRING;
        lpm_width  : NATURAL
    );
    PORT (
        result : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
    END COMPONENT;

BEGIN
    result <= sub_wire0(15 DOWNTO 0);

    LPM_CONSTANT_component : LPM_CONSTANT
    GENERIC MAP (
        lpm_cvalue => 128,
        lpm_hint   => "ENABLE_RUNTIME_MOD=NO",
        lpm_type   => "LPM_CONSTANT",
        lpm_width  => 16
    )
    PORT MAP (
        result => sub_wire0
    );
END SYN;
