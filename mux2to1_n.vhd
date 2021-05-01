library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Package_6541.all;



entity mux2to1_n  is
GENERIC (
		n:INTEGER:=4
		);
		
	port (
		din0 : in std_logic_vector(n-1 downto 0):=(others=>'0');
		din1 : in std_logic_vector(n-1 downto 0):=(others=>'0');
		sel  : in std_logic;
		dout : out std_logic_vector(n-1 downto 0):=(others=>'0')

	);
end mux2to1_n ;

architecture Structural of mux2to1_n is

begin

Load_Gate:FOR i IN 0 TO n-1 GENERATE
	G_MUX: mux2to1  PORT MAP (din0(i),din1(i),sel,dout(i));

	END GENERATE Load_Gate;


end Structural;

