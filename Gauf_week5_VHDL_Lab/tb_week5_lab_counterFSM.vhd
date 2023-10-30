library IEEE; use IEEE.STD_LOGIC_1164.all;

entity tb_week5_lab_counterFSM is
end;


architecture sim of tb_week5_lab_counterFSM is
	component counterFSM
		port(	clk, reset, d:	in	STD_LOGIC;
			y:		out	STD_LOGIC_VECTOR(2 downto 0));
	end component;
	signal clk, reset, d:	STD_LOGIC;		
	--signal y:		STD_LOGIC_VECTOR(2 downto 0);		
begin
	--instantiate dut
	dut: counterFSM port map(clk, reset, d, y);

	--generate clock
	process begin
		clk <= '1';	wait for 5ps;
		clk <= '0';	wait for 5ps;
	end process;

	process begin
		--reset to start state
		reset <= 	'1'; 
		d <=		'0'; 	wait for 10ps;
		--let it go through full cycle
		reset <= 	'0'; 	wait for 80ps;
		-- reverse direction for halway 
		d <=		'1';	wait for 40ps;
		-- test reset from midstate
		reset <=	'1';	wait;
	end process;
end;


