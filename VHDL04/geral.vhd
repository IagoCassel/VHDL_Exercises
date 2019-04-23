entity geral is

port(
A0, B0  : in bit_vector (3 downto 0);
C: in bit;
R : out bit_vector (7 downto 0)
);

end geral;

architecture geral_arc of geral is

signal S: bit_vector (4 downto 0);
signal BCD0: bit_vector (11 downto 0);

component binary is

port(
EN : in bit_vector (7 downto 0);
BCD : out bit_vector (11 downto 0)
);

end component;

component four_bit_adder is

port(
Af, Bf  : in bit_vector(3 downto 0);
Cin: in bit;
Sf : out bit_vector(3 downto 0);
Cout : out bit
);

end component;

begin

ad1: four_bit_adder port map(
  Af => A0,
  Bf => B0,
  Cin => C,
  Sf(3 downto 0) => S(3 downto 0)
);

ad2: four_bit_adder port map(
  Af => A0,
  Bf => B0,
  Cin => C,
  Cout => S(4)
);

convert1: binary port map(
  EN(7) => '0',
  EN(6) => '0',
  EN(5) => '0',
  EN(4 downto 0) => S(4 downto 0),
  BCD => BCD0
);

R(0) <= BCD0(0);
R(1) <= BCD0(1);
R(2) <= BCD0(2);
R(3) <= BCD0(3);
R(4) <= BCD0(4);
R(5) <= BCD0(5);
R(6) <= BCD0(6);
R(7) <= BCD0(7);

end geral_arc;