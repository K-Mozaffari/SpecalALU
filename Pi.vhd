
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 

		 
		 
		  
		ENTITY Pi IS  

		   PORT( 
		        A,B	:	IN  std_logic; 
		        P 	:	OUT  std_logic
		         );  
		 END  Pi ;  
		 
		 ARCHITECTURE structural OF Pi IS  

		 BEGIN  
P<= A XOR B;
		 END structural;
