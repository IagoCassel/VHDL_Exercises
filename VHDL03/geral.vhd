entity geral is

port(
SW : in bit_vector (7 downto 0);
HEX0, HEX1, HEX2 : out bit_vector (6 downto 0)
);

end geral;

architecture geral_arc of geral is

signal BCD_SW: bit_vector (11 downto 0);

component binary is

port(
EN : in bit_vector (7 downto 0);
BCD : out bit_vector (11 downto 0)
);

end component;

component display is

port(
E : in bit_vector (3 downto 0);
HEX: out bit_vector (6 downto 0)
);

end component;

begin

convert: binary port map(
  EN => SW,
  BCD => BCD_SW
);

display0: display port map(
  E(3 downto 0) => BCD_SW(3 downto 0),
  HEX => HEX0
);

display1: display port map(
  E(3 downto 0) => BCD_SW(7 downto 4),
  HEX => HEX1
);

display2: display port map(
  E(3 downto 0) => BCD_SW(11 downto 8),
  HEX => HEX2
);

end geral_arc;