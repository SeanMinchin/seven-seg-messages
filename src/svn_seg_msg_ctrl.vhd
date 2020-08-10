library ieee;
use ieee.std_logic_1164.all;
use work.DE10_LITE_LIB.all;
use work.SVN_SEG_LIB.all;

entity svn_seg_msg_ctrl is
	port (
		clk          : in  std_logic;
		rst   	     : in  std_logic;
		svn_seg_disp : out seven_seg_disp_t;
		svn_seg_dp   : out seven_seg_dp_t
	);
end svn_seg_msg_ctrl;

architecture BHV of svn_seg_msg_ctrl is
	constant C_MSG_SIZE : positive := 16;
	type msg_array is array (0 to C_MSG_SIZE-1) of std_logic_vector(6 downto 0);
	constant C_MSG : msg_array := (
		0 => C_H,
		1 => C_A,
		2 => C_P,
		3 => C_P,
		4 => C_Y,
		5 => C_BLANK,
		6 => C_D,
		7 => C_A,
		8 => C_D,
		9 => C_APOSTROPHE,
		10 => C_S,
		11 => C_BLANK,
		12 => C_D,
		13 => C_A,
		14 => C_Y,
		15 => C_EXCLAMATION
	);

	constant C_COUNTER_START : integer := 0 - (svn_seg_disp'LENGTH-1);
	constant C_COUNTER_END   : integer := C_MSG_SIZE-1;
	signal count : integer range C_COUNTER_START to C_COUNTER_END;
begin
	process(clk, rst)
	begin
		if(rst = '1') then
			count <= C_COUNTER_START;
		elsif(rising_edge(clk)) then
			if(count = C_COUNTER_END) then
				count <= C_COUNTER_START;
			else
				count <= count + 1;
			end if;
		end if;
	end process;

	process(count)
		variable symbol : std_logic_vector(6 downto 0);
		variable idx    : integer range 0 - (svn_seg_disp'LENGTH-1) to C_MSG_SIZE-1 + svn_seg_disp'LENGTH-1;
	begin
		for i in svn_seg_disp'range loop
			idx := count + svn_seg_disp'length - 1 - i;
			symbol := C_MSG(idx);

			if(idx > C_MSG_SIZE-1 or idx < 0) then
				svn_seg_disp(i) <= C_BLANK;
				svn_seg_dp(i) <= C_DP_OFF;
			else
				svn_seg_disp(i) <= symbol;
				if(symbol = C_EXCLAMATION) then
					svn_seg_dp(i) <= C_DP_ON;
				else
					svn_seg_dp(i) <= C_DP_OFF;
				end if;
			end if;
		end loop;
	end process;
end BHV;