library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clk_div is
	generic (
		clk_in_freq  : natural;
		clk_out_freq : natural
	);
	port (
		clk_in  : in  std_logic;
		clk_out : out std_logic;
		rst     : in  std_logic
	);
end clk_div;

architecture BHV of clk_div is
	constant C_RATIO : natural := clk_in_freq/clk_out_freq; -- ratio = f_in / f_out
	signal count : positive;
begin
	process(clk_in, rst)
	begin
		if(rst = '1') then
			count <= 1;
			clk_out <= '0';
		elsif(rising_edge(clk_in)) then
			if(count = C_RATIO) then
				count <= 1;
				clk_out <= '1';
			else
				count <= count + 1;
				clk_out <= '0';
			end if;
		end if;
	end process;
end BHV;