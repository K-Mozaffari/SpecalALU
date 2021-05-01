
		 library IEEE; 
		 use IEEE.STD_LOGIC_1164.all; 
		 USE WORK.Package_6541.ALL;
		  
		ENTITY DFF IS  
		   PORT( 
				Clk		:	IN 	std_logic;
				Ld		:	IN	std_logic;
				Rst		:	IN 	std_logic:='0';
				Din		:	IN 	std_logic:='0';
				Q_out		:	OUT	std_logic:='0';
				Qn_out		:	OUT	std_logic:='1'
		        );
		        
		 END  DFF;  
		 ARCHITECTURE structural OF DFF IS  
			SIGNAL SIG_temp : std_logic:='0';
			SIGNAL SIG_temp_n: std_logic:='1';

			BEGIN
process(clk) 
begin
	 if (Rst='1') then
	SIG_temp <= '0';
	SIG_temp_n <= '1';
	END IF ;
	
  if(rising_edge(Clk)) then
	IF (Rst='0' and Ld='1') THEN 
	SIG_temp<= Din;
	SIG_temp_n<= Not(Din);
	end if;

  end if;
end process;
Q_out<=SIG_temp;
	Qn_out<=SIG_temp_n;		
     
		 END structural;
