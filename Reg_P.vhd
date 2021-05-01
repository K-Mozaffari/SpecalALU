
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		  
		ENTITY Reg_P IS  
		GENERIC (
				n:INTEGER:=8
		);
		   PORT( 
				Clk		:	IN 	std_logic:='0';
				Ld		:	IN	std_logic:='0';
				Rst		:	IN	std_logic:='0';
				D		:	IN 	std_logic_vector(n-1 downto 0):=(others=>'0');
				Q		:	OUT	std_logic_vector(n-1 downto 0):=(others=>'0')

		        );
		        
		 END  Reg_P;  
		 
		 ARCHITECTURE structural OF Reg_P IS  

			BEGIN
M_G: FOR i IN 0 TO n-1 GENERATE 

				G_DFF: DFF PORT MAP (Clk,Ld,Rst,D(i),Q(i));
				
	END GENERATE M_G;

		 END structural;
