library ieee;
use ieee.std_logic_1164.all;

entity rejestr is
	generic
	(
		delay:	time:=500 ps;
	);

	port
	(
		reset:		in	std_logic;
		ie:		in	std_logic;
		oe:		in	std_logic;
		data_i:	in	std_logic_vector(7 downto 0);
		data_o:	out	std_logic_vector(7 downto 0);
		ag:		out	std_logic_vector(7 downto 0)
	);
end rejestr;

architecture bhv of rejestr is
	signal tmp_val:	std_logic_vector(7 downto 0);
begin
	process(clk, reset, ctrl)
	begin
		if(rising_edge(clk))
		then
			if(reset='1')
			then
				tmp_val<="00000000";
			elsif(ctrl="00")
			then
				data_o<=tmp_val;
			elsif(ctrl="01")
			then
				tmp_val<=data_i;
			elsif(ctrl="10")
			then
				ag<=tmp_val;
			else
				data<="ZZZZZZZZ";
				ag<="ZZZZZZZZ";
			end if;
		end if;
	end process;
end bhv;
