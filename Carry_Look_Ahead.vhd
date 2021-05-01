
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 use work.package_6541.all;
		 
		 
		  
		ENTITY Carry_Look_Ahead IS  
			GENERIC (
				n:INTEGER:=4
				);
		   PORT( 
		        A,B	:	IN  std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cin 	:	IN  std_logic:='0';
		        Sout	:	OUT std_logic_vector(n-1 DOWNTO 0):=(others=>'0'); 
		        Cout	:	OUT std_logic:='0'
		         );  
		 END  Carry_Look_Ahead ;  
		 
		 ARCHITECTURE structural OF Carry_Look_Ahead IS  
		SIGNAL G,P,S:STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		SIGNAL C:STD_LOGIC_VECTOR(n DOWNTO 0);
		 BEGIN  
		 C(0)<=Cin;
		 G0:FOR i IN 0 TO n-1 GENERATE 
		GATE_G: Gi PORT MAP (A(i),B(i),G(i));
		GATE_P: Pi PORT MAP (A(i),B(i),P(i));
		Gate_C_Pluse1: Ci_p PORT MAP (G(i),P(i),C(i),C(i+1));

		 GATE_SUM: SUMi PORT MAP (P(i),C(i),S(i));		 
		 		 
		 END GENERATE;
		 Sout<=S;
		 Cout<=C(n);
		 

		 END structural;
