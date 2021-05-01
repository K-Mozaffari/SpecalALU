library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux2to1  is

	port (
		din0 : in std_logic;
		din1 : in std_logic;
		sel  : in std_logic;
		dout : out std_logic

	);
end mux2to1 ;

architecture Structural of mux2to1 is
SIGNAL SIG1, SIG2 :std_LOGIC:='0';
begin

SIG1<=din0 AND (NOT (sel));
SIG2<=din1 AND sel;
dout<= SIG1 OR SIG2;


end Structural;

