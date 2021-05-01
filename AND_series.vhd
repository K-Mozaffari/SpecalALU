
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		USE ieee.numeric_std.ALL;
 
		  
		ENTITY AND_series IS  
		GENERIC(
				n:INTEGER:=4
				);

		   PORT( 
				Input	:IN 	std_logic_vector(n-1 DOWNTO 0);
				Output	:OUT	std_logic
		         );  
		 END  AND_series ;  
		 
		 ARCHITECTURE structural OF AND_series IS  
SIGNAL s:std_logic_vector(n-2 DOWNTO 0):=(OTHERS=>'0');
			BEGIN



n1:if n=1 generate
output<=input(0);
end generate;

n4:if n=2 generate 
output<=input(0) AND input(1);
end generate;

nrest:if n>2 generate 
s(0)<=input(0)AND input(1);
detect:for i in 2 to n-1 generate 
s(i-1)<=s(i-2) AND Input(i);
end generate;

Output<=s(n-2);
end generate;


		 END structural;
