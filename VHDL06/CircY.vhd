entity Y is
port(
A: in bit_vector(3 downto 0);
CLKY, RESY, ENABLE: in bit;
RY: out bit_vector(3 downto 0)
);
end Y;

architecture Y_arc of Y is
signal QY : bit_vector(3 downto 0);
signal SET : bit_vector(3 downto 0);
  
component ffd is

port(
D, CLK, S, RS: in bit;
Q: out bit
);

end component;

begin
    
SET(3) <= A(3) NAND ENABLE;
SET(2) <= A(2) NAND ENABLE;
SET(1) <= A(1) NAND ENABLE;
SET(0) <= A(0) NAND ENABLE;
    

ffd1 : ffd port map(
D => '0',
CLK => CLKY,
S => SET(0),
RS => RESY,
Q => QY(0)
);
    
ffd2 : ffd port map(
D => QY(0),
CLK => CLKY,
S => SET(1),
RS => RESY,
Q => QY(1)
);
    
ffd3 : ffd port map(
D => QY(1),
CLK => CLKY,
S => SET(2),
RS => RESY,
Q => QY(2)
);
    
ffd4 : ffd port map(
D => QY(2),
CLK => CLKY,
S => SET(3),
RS => RESY,
Q => QY(3)
);
    
RY <= QY;
    
end Y_arc;