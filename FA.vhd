
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		  use work.package_6541.all;
		  
		ENTITY FA IS  
	
			
		   PORT( 
		        A,B		:	IN  std_logic;  
		        Cin		:	IN	std_logic;
		        Sout	:	OUT std_logic;
		        Cout	:	OUT	std_logic
		         );  
		 END  FA;  
		 ARCHITECTURE structural OF FA IS  
			SIGNAL S_HA,C_HA :STD_LOGIC;
		 BEGIN  
			
			G_HA: HA PORT MAP (A,B,S_HA,C_HA);
			Sout<=	Cin xor S_ha;
			Cout<= 	C_Ha or (Cin and S_HA);	  
		 END structural;
