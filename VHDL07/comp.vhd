entity comp is
port(

Ax, Bx: in bit_vector(3 downto 0);
Rx: out bit
);

end comp;

architecture comp_arc of comp is
begin

Rx <= (Ax(3) xnor Bx(3)) and (Ax(2) xnor Bx(2)) and (Ax(1) xnor Bx(1)) and (Ax(0) xnor Bx(0));

end comp_arc;