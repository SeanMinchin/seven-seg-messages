library ieee;
use ieee.std_logic_1164.all;
use work.DE10_LITE_lib.all;

entity svn_seg_msg_top_level is
	port (
		clk50MHz     : in  std_logic;
		button_n     : in  push_button_bank_n_t;
		svn_seg_disp : out seven_seg_disp_t;
		svn_seg_dp   : out seven_seg_dp_t
	);
end svn_seg_msg_top_level;

architecture STR of svn_seg_msg_top_level is
	constant C_OUT_CLK_F : positive := 2; -- 2 Hz

	signal slow_clk : std_logic;
	signal rst      : std_logic;
begin
	U_CLK_DIV : entity work.clk_div
		generic map (
			clk_in_freq  => C_FPGA_CLK_F,
			clk_out_freq => C_OUT_CLK_F
		)
		port map (
			clk_in => clk50MHz,
			clk_out => slow_clk,
			rst => rst
		);

	U_CTRL : entity work.fathers_day_ctrl
		port map (
			clk => slow_clk,
			rst => rst,
			svn_seg_disp => svn_seg_disp,
			svn_seg_dp => svn_seg_dp
	);

	-- active low buttons
	rst <= not button_n(0) or not button_n(1);
end STR;