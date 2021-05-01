
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 

		 
		 
		  
		ENTITY Ci_p IS  

		   PORT( 
		        G,P,C	:	IN  std_logic; 
		        Cp	:	OUT  std_logic
		         );  
		 END  Ci_p ;  
		 
		 ARCHITECTURE structural OF Ci_p IS  

		 BEGIN  
Cp<= G OR ( P AND C);
		 END structural;
