
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 

		 
		 
		  
		ENTITY SUMi IS  

		   PORT( 
		        P,C	:	IN  std_logic; 
		        S	:	OUT  std_logic
		         );  
		 END  SUMi ;  
		 
		 ARCHITECTURE structural OF SUMi IS  

		 BEGIN  
S<= P XOR C;
		 END structural;
