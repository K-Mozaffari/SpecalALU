
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		  
		ENTITY Shift_Reg_R IS  
		GENERIC (
				n:INTEGER:=2
		);
		   PORT( 
				Clk		:	IN 	std_logic:='0';
				Ld		:	IN 	std_logic:='0';
				Sh		:	IN 	std_logic:='0';
				Rst		:	IN	std_logic:='0';
				D_First	:	IN	std_logic:='0';
				REG_in	:	IN 	std_logic_vector(n-1 downto 0):=(others=>'0');
				Q		:	OUT	std_logic_vector(n-1 downto 0):=(others=>'0')

		        );
		        
		 END  Shift_Reg_R;  
		 
	 ARCHITECTURE structural OF Shift_Reg_R IS  
		SIGNAL Om :std_logic_vector (n-1 downto 0):=(others=>'0');
		SIGNAL Os :std_logic_vector (n downto 0):=(others=>'0');		
		SIGNAL LdSh :std_logic:='0';
	 BEGIN		
LdSh<=Ld OR Sh;
				Os(n)<=D_First;
		M_G: FOR i IN 0  TO n-1 GENERATE 
	
		G_MUX: 	MUX2TO1 GENERIC MAP (n) PORT MAP (Os(i+1),REG_in(i),Ld,Om(i));
		G_DFF: 	DFF 			PORT MAP (Clk,LdSh,Rst,Om(i),Os(i))	;
		END GENERATE M_G;
	
			Q<=Os(n-1 downto 0);
	

		 END structural;
