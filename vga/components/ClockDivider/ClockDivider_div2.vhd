library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ClockDivider is
	port (
		CLK_IN  : in  std_logic;
		RST     : in  std_logic;
		PAUSE   : in  std_logic;
		CLK_OUT : out std_logic
	);
end entity;

architecture rtl of ClockDivider is
	signal clk_div : std_logic := '0';
begin

	-- Divide input clock frequency by 2.
	-- Example: 50 MHz input -> 25 MHz output.
	process (CLK_IN)
	begin
		if rising_edge(CLK_IN) then
			if RST = '1' then
				clk_div <= '0';
			elsif PAUSE = '0' then
				clk_div <= not clk_div;
			end if;
		end if;
	end process;

	CLK_OUT <= clk_div;

end rtl;
