entity fourbit_updown_counter is
port(

UDc, CLKc, RSc: in bit;
Sc: in bit_vector(3 downto 0);
Qc: out bit_vector(3 downto 0)
);

end fourbit_updown_counter;

architecture fourbit_updown_counter_arc of fourbit_updown_counter is

signal Qr, Sck, RSck: bit_vector(3 downto 0);
signal JKr: bit_vector(2 downto 0);
signal Rcomp, Raux: bit;

component FFJK is
port(

J, K, CLK, S, RS: in bit;
Q: out bit
);

end component;

component comp is
port(

Ax, Bx: in bit_vector(3 downto 0);
Rx: out bit
);

end component;

begin
  
comp1: comp port map(
Ax(3) => '1',
Ax(2) => '0',
Ax(1) => '1',
Ax(0) => '0',
Bx => Qr,
Rx => Raux
);

comp2: comp port map(
Ax(3) => '1',
Ax(2) => '1',
Ax(1) => '1',
Ax(0) => '1',
Bx => Qr,
Rx => Rcomp
);

RSck(0) <= RSc and (not(Raux));
RSck(1) <= RSc and (not(Raux)) and (not(Rcomp));
RSck(2) <= RSc and (not(Raux)) and (not(Rcomp));
RSck(3) <= RSc and (not(Raux));

Sck(0) <= Sc(0);
Sck(1) <= Sc(1);
Sck(2) <= Sc(2);
Sck(3) <= Sc(3);

ffjk0 : FFJK port map(
J => '1',
K => '1',
CLK => CLKc,
S => Sck(0),
RS => RSck(0),
Q => Qr(0)
);

JKr(0) <= ( (Qr(0)) and (UDc) ) or ( (not Qr(0)) and (not UDc) );

ffjk1 : FFJK port map(
J => JKr(0),
K => JKr(0),
CLK => CLKc,
S => Sck(1),
RS => RSck(1),
Q => Qr(1)
);

JKr(1) <= ( (Qr(1)) and ((Qr(0)) and (UDc)) ) or ( (not Qr(1)) and ((not Qr(0)) and (not UDc)) );

ffjk2 : FFJK port map(
J => JKr(1),
K => JKr(1),
CLK => CLKc,
S => Sck(2),
RS => RSck(2),
Q => Qr(2)
);

JKr(2) <= ( (Qr(2)) and ((Qr(1)) and ((Qr(0)) and (UDc))) ) or ( (not Qr(2)) and ((not Qr(1)) and ((not Qr(0)) and (not UDc))) );

ffjk3 : FFJK port map(
J => JKr(2),
K => JKr(2),
CLK => CLKc,
S => Sck(3),
RS => RSck(3),
Q => Qr(3)
);

Qc <= Qr;

end fourbit_updown_counter_arc;
