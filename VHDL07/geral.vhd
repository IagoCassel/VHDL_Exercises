entity geral is
port(

UDg, CLKg, RSg, LSg: in bit;
A: in bit_vector(7 downto 0);
Qg: out bit_vector(7 downto 0)
);

end geral;

architecture geral_arc of geral is

signal Ag1, Ag2, Qg1, Qg2: bit_vector(3 downto 0);
signal CLKg1, RSga: bit;

component fourbit_updown_counter is
port(

UDc, CLKc, RSc: in bit;
Sc: in bit_vector(3 downto 0);
Qc: out bit_vector(3 downto 0)
);

end component;

component comp is
port(

Ax, Bx: in bit_vector(3 downto 0);
Rx: out bit
);
end component;

begin

Ag1(0) <=  A(0) nand LSg;
Ag1(1) <=  A(1) nand LSg;
Ag1(2) <=  A(2) nand LSg;
Ag1(3) <=  A(3) nand LSg;
Ag2(0) <=  A(4) nand LSg;
Ag2(1) <=  A(5) nand LSg;
Ag2(2) <=  A(6) nand LSg;
Ag2(3) <=  A(7) nand LSg;

unidade : fourbit_updown_counter port map(
UDc => UDg,
CLKc => CLKg,
Sc(3 downto 0) => Ag1(3 downto 0),
RSc => RSg,
Qc(3 downto 0) => Qg1(3 downto 0)
);

comp1: comp port map(
Ax(3) => '0',
Ax(2) => '0',
Ax(1) => '0',
Ax(0) => '0',
Bx => Qg1,
Rx => CLKg1
);

dezena : fourbit_updown_counter port map(
UDc => UDg,
CLKc => CLKg1,
Sc(3 downto 0) => Ag2(3 downto 0),
RSc => RSg,
Qc(3 downto 0) => Qg2(3 downto 0)
);

Qg(0) <= Qg1(0);
Qg(1) <= Qg1(1);
Qg(2) <= Qg1(2);
Qg(3) <= Qg1(3);
Qg(4) <= Qg2(0);
Qg(5) <= Qg2(1);
Qg(6) <= Qg2(2);
Qg(7) <= Qg2(3);

end geral_arc;