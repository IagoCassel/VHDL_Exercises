entity binary is

port(
EN : in bit_vector (7 downto 0);
BCD : out bit_vector (11 downto 0)
);

end binary;

architecture binary_to_bcd of binary is

signal S_1, S_2, S_3, S_4, S_5: bit_vector (3 downto 0);

component binary_func is

port(
A : in bit_vector (3 downto 0);
S : out bit_vector (3 downto 0)
);
end component;

begin

func1: binary_func port map(
  A(3) => '0',
  A(2 downto 0) => EN(7 downto 5),
  S => S_1
);

func2: binary_func port map(
  A(3 downto 1) => S_1(2 downto 0),
  A(0) => EN(4),
  S => S_2
);

func3: binary_func port map(
  A(3 downto 1) => S_2(2 downto 0),
  A(0) => EN(3),
  S => S_3
);

func4: binary_func port map(
  A(3) => '0',
  A(2) => S_1(3),
  A(1) => S_2(3),
  A(0) => S_3(3),
  S => S_4
);

func5: binary_func port map(
  A(3 downto 1) => S_3(2 downto 0),
  A(0) => EN(2),
  S => S_5
);

func6: binary_func port map(
  A(3 downto 1) => S_4(2 downto 0),
  A(0) => S_5(3),
  S(3 downto 0) => BCD(8 downto 5)
);

func7: binary_func port map(
  A(3 downto 1) => S_5(2 downto 0),
  A(0) => EN(1),
  S(3 downto 0) => BCD(4 downto 1)
);

BCD(11) <= '0';
BCD(10) <= '0';
BCD(9) <= S_4(3);
BCD(0) <= EN(0);

end binary_to_bcd;