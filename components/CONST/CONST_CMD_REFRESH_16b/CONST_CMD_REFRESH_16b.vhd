LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY CONST_CMD_REFRESH_16b IS
    PORT (
        result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END CONST_CMD_REFRESH_16b;

ARCHITECTURE rtl OF CONST_CMD_REFRESH_16b IS
BEGIN
    result <= std_logic_vector(to_unsigned(64, 16));
END rtl;
