
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 
		  
		ENTITY HA IS  
		   PORT( 
		        A,B		:	IN  std_logic;  
		        S,Cout	:	OUT std_logic
		         );  
		 END  HA;  
		 ARCHITECTURE structural OF HA IS  
 
		 BEGIN  
				S   <= A xor B;
				Cout<= A and B;  
		 END structural;
