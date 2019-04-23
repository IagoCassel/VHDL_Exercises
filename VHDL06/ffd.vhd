entity ffd is
port(
D, CLK, S, RS: in bit;
Q: out bit
);
end ffd;

architecture ffd_arc of ffd is
begin

	process(S, RS, CLK)

	begin
	if (S = '1') and (RS = '1') then
  	  if (CLK = '1') and (CLK'EVENT) then
  	    Q <= D;
  	  end if;
	elsif (RS = '0') then Q <= '0';
	elsif (S = '0') then Q <= '1';
	end if;

	end process;

end ffd_arc;