entity X is
port(
R: in bit_vector(3 downto 0);
CLKX, RESX: in bit;
Z: out bit_vector(3 downto 0)
);
end X;

architecture X_arc of X is

signal RZ: bit_vector(3 downto 0);

component ffd is
port(
D, CLK, S, RS: in bit;
Q: out bit
);
end component;

begin

ffd1 : ffd port map(
D => R(3),
CLK => CLKX,
S => '1',
RS => RESX,
Q => RZ(0)
);
    
ffd2 : ffd port map(
D => RZ(0),
CLK => CLKX,
S => '1',
RS => RESX,
Q => RZ(1)
);
    
ffd3 : ffd port map(
D => RZ(1),
CLK => CLKX,
S => '1',
RS => RESX,
Q => RZ(2)
);
    
ffd4 : ffd port map(
D => RZ(2),
CLK => CLKX,
S => '1',
RS => RESX,
Q => RZ(3)
);

Z <= RZ;

end X_arc;