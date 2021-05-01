--- This is a test bench to verify the arithmetic unit


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use work.package_6541.all;

ENTITY TEST_Multiplier IS 
generic (
		n: integer:=4;
		ADD:integer:=2
			);
END TEST_Multiplier;
 ARCHITECTURE ST OF TEST_Multiplier IS 
signal A_bin,B_bin:  std_logic_vector(n-1 DOWNTO 0);
signal z1_Bin,z_Bin :  std_logic_vector(2*n DOWNTO 0);
signal z0,Result_INT,A,B,Z1:integer:=0;
SIGNAL ST,CLR,End_Flag,CLK:STD_LOGIC:='0';
signal gnd :std_logic_vector(2*n downto 0):=(others=>'0');
begin




        process -- controle de clock
        begin
            clk <= not clk;
            wait for 1 ns;
        end process;
     Z1<=(A*B)+4;   
PROCESS 
 
BEGIN 
G0:for i in 1 to 252 loop
A<=i;
 G1: FOR j in 1 to 252 loop
B<=j;



St<='0';
Clr<='1';
 wait for 2 ns;
St<='1';
Clr<='0';
wait until end_Flag='1';

assert (z1_bin=Z_Bin) report "x fault" severity  FAILURE;


end loop;

end loop;

END PROCESS;
A_bin<=conv_std_logic_vector((A),n);
B_bin<=conv_std_logic_vector((B),n);


T:		  Multiplier_Z 	Generic MAP (n,ADD)PORT	map (Clk,St,Clr,A_bin,B_bin,Z_Bin,End_Flag );



z1_bin<=conv_std_logic_vector((z1),2*n+1);



end ST;
