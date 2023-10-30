library IEEE; use IEEE.STD_LOGIC_1164.all;

entity tb_week5_lab_partial_decoder is
end;

architecture sim of tb_week5_lab_partial_decoder is
	component partial_decoder
		port(	a:	in	STD_LOGIC_VECTOR(3 downto 0);
			y:	out	STD_LOGIC_VECTOR(9 downto 0));
	end component;
	signal a:	STD_LOGIC_VECTOR(3 downto 0);		
	signal y:	STD_LOGIC_VECTOR(9 downto 0);		
begin
	--instantiate dut
	dut: partial_decoder port map(a,y);

	--apply inputs one at a time
	process begin
		a <= "0000"; 	wait for 10ns;
		a <= "0001"; 	wait for 10ns;
		a <= "0010"; 	wait for 10ns;
		a <= "0011"; 	wait for 10ns;
		a <= "0100"; 	wait for 10ns;
		a <= "0101"; 	wait for 10ns;
		a <= "0110"; 	wait for 10ns;
		a <= "0111"; 	wait for 10ns;
		a <= "1000"; 	wait for 10ns;
		a <= "1001"; 	wait for 10ns;
		a <= "1010"; 	wait for 10ns;
		a <= "1011"; 	wait for 10ns;
		a <= "1100"; 	wait for 10ns;
		a <= "1101"; 	wait for 10ns;
		a <= "1110"; 	wait for 10ns;
		a <= "1111"; 	wait for 10ns;
				wait;
	end process;
end;


