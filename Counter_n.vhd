
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		USE ieee.numeric_std.ALL;
 
		  
		ENTITY Counter_n IS  
GENERIC (
n:integer:=8

);


		   PORT( 
				Clk		:IN 	std_logic;
				Count_cmd	:IN 	std_logic;
				Rst		:IN 	std_logic;
				C2		:OUT	std_logic;
				C8		:OUT	std_logic
		         );  
		 END  Counter_n ;  
		 
		 ARCHITECTURE structural OF Counter_n IS  
signal Q:std_logic_vector(n-2 downto 0):=(OTHERS=>'0');
signal Q_n:std_logic_vector(n-2 downto 0):=(OTHERS=>'1');
SIGNAL A,T:STD_LOGIC;
			BEGIN

FF:for i in 0 to n-2 generate
g0:if i=0 generate
G0_DFF:DFF PORT MAP (Clk,Count_cmd,Rst,T,Q(0),Q_n(0));
end generate;


GG:if i/=0 generate
G_DFF:DFF PORT MAP (Clk,Count_cmd,Rst,Q(i-1),Q(i),Q_n(i));
end generate;


end generate;
Test:AND_series GENERIC MAP(n-1) PORT MAP(Q_n,A);
T<=A OR Q(n-2);

C2<=Q(1) ;
C8<=Q(n-2);




		 END structural;
