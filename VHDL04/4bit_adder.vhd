entity four_bit_adder is

port(
Af, Bf  : in bit_vector(3 downto 0);
Cin: in bit;
Sf : out bit_vector(3 downto 0);
Cout : out bit
);

end four_bit_adder;

architecture four_bit_adder_arc of four_bit_adder is

signal Cout0, Cout1, Cout2: bit;

component bit_adder is

port(
A, B, Ci  : in bit;
S, Co : out bit
);
end component;

begin

adder0: bit_adder port map(  
  A => Af(0),
  B => Bf(0),
  Ci => Cin,
  S => Sf(0)
);
c0: bit_adder port map(
  A => Af(0),
  B => Bf(0),
  Ci => Cin,
  Co => Cout0
);


adder1: bit_adder port map(
  A => Af(1),
  B => Bf(1),
  Ci => Cout0,
  S => Sf(1)
);
c1: bit_adder port map(
  A => Af(1),
  B => Bf(1),
  Ci => Cout0,
  Co => Cout1
);


adder2: bit_adder port map(
  A => Af(2),
  B => Bf(2),
  Ci => Cout1,
  S => Sf(2)
);
c2: bit_adder port map(
  A => Af(2),
  B => Bf(2),
  Ci => Cout1,
  Co => Cout2
);


adder3: bit_adder port map(
  A => Af(3),
  B => Bf(3),
  Ci => Cout2,
  S => Sf(3)
);
c3: bit_adder port map(
  A => Af(3),
  B => Bf(3),
  Ci => Cout2,
  Co => Cout
);

end four_bit_adder_arc;