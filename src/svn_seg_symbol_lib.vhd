library ieee;
use ieee.std_logic_1164.all;

package SVN_SEG_LIB is

-- active low 7-seg
constant C_H : std_logic_vector(6 downto 0) := "0001001";
constant C_A : std_logic_vector(6 downto 0) := "0001000";
constant C_P : std_logic_vector(6 downto 0) := "0001100";
constant C_Y : std_logic_vector(6 downto 0) := "0010001";
constant C_BLANK : std_logic_vector(6 downto 0) := "1111111";
constant C_D : std_logic_vector(6 downto 0) := "0100001";
constant C_APOSTROPHE : std_logic_vector(6 downto 0) := "1011111";
constant C_S : std_logic_vector(6 downto 0) := "0010010";
constant C_EXCLAMATION : std_logic_vector(6 downto 0) := "1111101";
constant C_DP_OFF : std_logic := '1';
constant C_DP_ON  : std_logic := '0';

end SVN_SEG_LIB;