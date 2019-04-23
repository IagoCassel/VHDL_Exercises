entity geral is
port(
AG : in bit_vector(3 downto 0);
ENABLEG, CLKG : in bit;
RESG : in bit_vector(1 downto 0);
ZG : out bit_vector(3 downto 0)
);
end geral;

architecture geral_arc of geral is

signal INFO: bit_vector(3 downto 0);

component Y is
port(
A: in bit_vector(3 downto 0);
CLKY, RESY, ENABLE: in bit;
RY: out bit_vector(3 downto 0)
);
end component;

component X is
port(
R: in bit_vector(3 downto 0);
CLKX, RESX: in bit;
Z: out bit_vector(3 downto 0)
);
end component;
 
begin

CY : Y port map(
A => AG,
RESY => RESG(0),
ENABLE => ENABLEG,
CLKY => CLKG,
RY => INFO
);

CX : X port map(
R => INFO,
RESX => RESG(1),
CLKX => CLKG,
Z => ZG
);

end geral_arc;
