entity geral is

port(
B: in bit_vector (6 downto 0);
R: out bit_vector (7 downto 0)
);

end geral;

architecture geral_arc of geral is

signal V0: bit_vector (6 downto 0);
signal V1: bit_vector (6 downto 0);
signal V11: bit_vector (6 downto 0);
signal BCD0: bit_vector (11 downto 0);
signal BCD1: bit_vector (11 downto 0);

component binary is

port(
EN : in bit_vector (7 downto 0);
BCD : out bit_vector (11 downto 0)
);

end component;

component seven_bit_adder is

port(
Af, Bf  : in bit_vector(6 downto 0);
Cin: in bit;
Sf : out bit_vector(6 downto 0);
Cout : out bit
);

end component;

begin

mux1: process (B) is
begin
if (B(6) = '0') then
V0(6 downto 0) <= B(6 downto 0);
else
V1(6 downto 0) <= not B(6 downto 0);
end if;
end process mux1;

seven_adder: seven_bit_adder port map(  
  Af(6 downto 0) => V1(6 downto 0),
  Bf(0) => '1',
  Bf(1) => '0',
  Bf(2) => '0',
  Bf(3) => '0',
  Bf(4) => '0',
  Bf(5) => '0',
  Bf(6) => '0',
  Cin => '0',
  Sf(6 downto 0) => V11(6 downto 0)
);

convert0: binary port map(  
  EN(6 downto 0) => V0(6 downto 0),
  EN(7) => '0',
  BCD(11 downto 0) => BCD0(11 downto 0)
);

convert1: binary port map(  
  EN(6 downto 0) => V11(6 downto 0),
  EN(7) => '0',
  BCD(11 downto 0) => BCD1(11 downto 0)
);

mux2: process (B) is
begin
if (B(6) = '0') then
R(7 downto 0) <= BCD0(7 downto 0);
else
R(7 downto 0) <= BCD1(7 downto 0);
end if;
end process mux2;

end geral_arc;