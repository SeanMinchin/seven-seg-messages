library ieee;
use ieee.std_logic_1164.all;

package DE10_LITE_LIB is

	constant C_FPGA_CLK_F  : positive := 50e6; -- 50 MHz
	constant C_ADC_CLK_F   : positive := 10e6; -- 10 MHz

	constant C_7SEG_CNT : natural := 6;
	type seven_seg_disp_t is array(C_7SEG_CNT-1 downto 0) of std_logic_vector(6 downto 0);
	type seven_seg_dp_t is array(C_7SEG_CNT-1 downto 0) of std_logic;

	type push_button_bank_n_t is array(1 downto 0) of std_logic;
	type switch_bank_t is array(9 downto 0) of std_logic;

	type led_bank_t is array(9 downto 0) of std_logic;

end DE10_LITE_LIB;