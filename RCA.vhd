
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		 
		 
		  
		ENTITY RCA IS  
			GENERIC (
				n:INTEGER:=4
				);
		   PORT( 
		        A,B	:	IN  std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cin 	:	IN  std_logic:='0';
		        Sout	:	OUT std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cout	:	OUT std_logic:='0'
		         );  
		 END  RCA ;  
		 
		 ARCHITECTURE structural OF RCA IS  
				
				signal C:std_logic_vector (n 	DOWNTO 0):=(others=>'0');
		 BEGIN  
		 
		 C(0)<=Cin;
			G: FOR i IN 0 TO n-1 GENERATE 
				G_FA:  FA PORT MAP (A(i),B(i),C(i),Sout(i),C(i+1));
			END GENERATE G;
	

			Cout<=	C(n);
		 END structural;
