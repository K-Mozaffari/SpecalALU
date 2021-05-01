
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 

		 
		 
		  
		ENTITY Gi IS  

		   PORT( 
		        A,B	:	IN  std_logic; 
		        G 	:	OUT  std_logic
		         );  
		 END  Gi ;  
		 
		 ARCHITECTURE structural OF Gi IS  

		 BEGIN  
G<= A AND B;
		 END structural;
