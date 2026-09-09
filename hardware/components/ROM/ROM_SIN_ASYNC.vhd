library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_SIN_ASYNC is
    port (
        address : in  std_logic_vector(5 downto 0);
        q       : out std_logic_vector(15 downto 0)
    );
end entity ROM_SIN_ASYNC;

architecture combinational of ROM_SIN_ASYNC is
begin

    process(address)
    begin
        case to_integer(unsigned(address)) is
            when  0 => q <= x"0000"; -- 0
            when  1 => q <= x"0331"; -- 817
            when  2 => q <= x"0661"; -- 1633
            when  3 => q <= x"0991"; -- 2449
            when  4 => q <= x"0CBF"; -- 3263
            when  5 => q <= x"0FEA"; -- 4074
            when  6 => q <= x"1314"; -- 4884
            when  7 => q <= x"163A"; -- 5690
            when  8 => q <= x"195D"; -- 6493
            when  9 => q <= x"1C7B"; -- 7291
            when 10 => q <= x"1F95"; -- 8085
            when 11 => q <= x"22AB"; -- 8875
            when 12 => q <= x"25BA"; -- 9658
            when 13 => q <= x"28C4"; -- 10436
            when 14 => q <= x"2BC7"; -- 11207
            when 15 => q <= x"2EC3"; -- 11971
            when 16 => q <= x"31B8"; -- 12728
            when 17 => q <= x"34A5"; -- 13477
            when 18 => q <= x"3789"; -- 14217
            when 19 => q <= x"3A65"; -- 14949
            when 20 => q <= x"3D37"; -- 15671
            when 21 => q <= x"4000"; -- 16384
            when 22 => q <= x"42BE"; -- 17086
            when 23 => q <= x"4572"; -- 17778
            when 24 => q <= x"481A"; -- 18458
            when 25 => q <= x"4AB8"; -- 19128
            when 26 => q <= x"4D49"; -- 19785
            when 27 => q <= x"4FCE"; -- 20430
            when 28 => q <= x"5246"; -- 21062
            when 29 => q <= x"54B1"; -- 21681
            when 30 => q <= x"570F"; -- 22287
            when 31 => q <= x"595F"; -- 22879
            when 32 => q <= x"5BA1"; -- 23457
            when 33 => q <= x"5DD4"; -- 24020
            when 34 => q <= x"5FF8"; -- 24568
            when 35 => q <= x"620D"; -- 25101
            when 36 => q <= x"6412"; -- 25618
            when 37 => q <= x"6608"; -- 26120
            when 38 => q <= x"67ED"; -- 26605
            when 39 => q <= x"69C1"; -- 27073
            when 40 => q <= x"6B85"; -- 27525
            when 41 => q <= x"6D38"; -- 27960
            when 42 => q <= x"6ED9"; -- 28377
            when 43 => q <= x"7069"; -- 28777
            when 44 => q <= x"71E6"; -- 29158
            when 45 => q <= x"7352"; -- 29522
            when 46 => q <= x"74AB"; -- 29867
            when 47 => q <= x"75F2"; -- 30194
            when 48 => q <= x"7726"; -- 30502
            when 49 => q <= x"7847"; -- 30791
            when 50 => q <= x"7955"; -- 31061
            when 51 => q <= x"7A4F"; -- 31311
            when 52 => q <= x"7B36"; -- 31542
            when 53 => q <= x"7C0A"; -- 31754
            when 54 => q <= x"7CC9"; -- 31945
            when 55 => q <= x"7D75"; -- 32117
            when 56 => q <= x"7E0D"; -- 32269
            when 57 => q <= x"7E91"; -- 32401
            when 58 => q <= x"7F01"; -- 32513
            when 59 => q <= x"7F5C"; -- 32604
            when 60 => q <= x"7FA3"; -- 32675
            when 61 => q <= x"7FD6"; -- 32726
            when 62 => q <= x"7FF5"; -- 32757
            when 63 => q <= x"7FFF"; -- 32767
            when others => q <= x"0000";
        end case;
    end process;

end architecture combinational;

