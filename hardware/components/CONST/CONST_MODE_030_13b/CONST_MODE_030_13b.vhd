-- megafunction wizard: %LPM_CONSTANT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_CONSTANT

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY CONST_MODE_030_13b IS
    PORT
    (
        result : OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
    );
END CONST_MODE_030_13b;

ARCHITECTURE SYN OF const_mode_030_13b IS

    SIGNAL sub_wire0 : STD_LOGIC_VECTOR (12 DOWNTO 0);

    COMPONENT lpm_constant
    GENERIC (
        lpm_cvalue : NATURAL;
        lpm_hint   : STRING;
        lpm_type   : STRING;
        lpm_width  : NATURAL
    );
    PORT (
        result : OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
    );
    END COMPONENT;

BEGIN
    result <= sub_wire0(12 DOWNTO 0);

    LPM_CONSTANT_component : LPM_CONSTANT
    GENERIC MAP (
        lpm_cvalue => 48,
        lpm_hint   => "ENABLE_RUNTIME_MOD=NO",
        lpm_type   => "LPM_CONSTANT",
        lpm_width  => 13
    )
    PORT MAP (
        result => sub_wire0
    );

END SYN;

-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: Radix NUMERIC "10"
-- Retrieval info: PRIVATE: Value NUMERIC "48"
-- Retrieval info: PRIVATE: nBit NUMERIC "13"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_CVALUE NUMERIC "48"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=NO"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CONSTANT"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "13"
-- Retrieval info: USED_PORT: result 0 0 13 0 OUTPUT NODEFVAL "result[12..0]"
-- Retrieval info: CONNECT: result 0 0 13 0 @result 0 0 13 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_MODE_030_13b.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_MODE_030_13b.bsf TRUE FALSE
-- Retrieval info: LIB_FILE: lpm
