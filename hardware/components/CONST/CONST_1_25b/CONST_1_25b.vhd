-- megafunction wizard: %LPM_CONSTANT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_CONSTANT

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY CONST_1_25b IS
    PORT
    (
        result : OUT STD_LOGIC_VECTOR (24 DOWNTO 0)
    );
END CONST_1_25b;

ARCHITECTURE SYN OF CONST_1_25b IS
    SIGNAL sub_wire0 : STD_LOGIC_VECTOR (24 DOWNTO 0);

    COMPONENT lpm_constant
    GENERIC (
        lpm_cvalue : NATURAL;
        lpm_hint   : STRING;
        lpm_type   : STRING;
        lpm_width  : NATURAL
    );
    PORT (
        result : OUT STD_LOGIC_VECTOR (24 DOWNTO 0)
    );
    END COMPONENT;
BEGIN
    result <= sub_wire0(24 DOWNTO 0);

    LPM_CONSTANT_component : LPM_CONSTANT
    GENERIC MAP (
        lpm_cvalue => 1,
        lpm_hint   => "ENABLE_RUNTIME_MOD=NO",
        lpm_type   => "LPM_CONSTANT",
        lpm_width  => 25
    )
    PORT MAP (
        result => sub_wire0
    );
END SYN;

-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: Value NUMERIC "1"
-- Retrieval info: PRIVATE: nBit NUMERIC "25"
-- Retrieval info: CONSTANT: LPM_CVALUE NUMERIC "1"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=NO"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CONSTANT"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "25"
-- Retrieval info: USED_PORT: result 0 0 25 0 OUTPUT NODEFVAL "result[24..0]"
-- Retrieval info: CONNECT: result 0 0 25 0 @result 0 0 25 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_1_25b.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_1_25b.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_1_25b.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_1_25b.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL CONST_1_25b_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
