entity display is

port(
E : in bit_vector (3 downto 0);
HEX: out bit_vector (6 downto 0)
);

end display;

architecture display_arc of display is

begin

--A=E(3), B=E(2), C=E(1), D=E(0)

HEX(6) <= E(1) or E(3) or ((not(E(2))) and (not(E(0)))) or (E(2) and E(0));
HEX(5) <= (not(E(2))) or ((not(E(1))) and (not(E(0)))) or (E(1) and E(0));
HEX(4) <= (not(E(1))) or E(0) or E(2);
HEX(3) <= ((not(E(2))) and (not(E(0)))) or ((not(E(2))) and E(1)) or (E(1) and (not(E(0)))) or (E(2) and (not(E(1))) and E(0));
HEX(2) <= ((not(E(2))) and (not(E(0)))) or (E(1) and (not(E(0))));
HEX(1) <= E(3) or ((not(E(1))) and (not(E(0)))) or (E(2) and (not(E(1)))) or (E(2) and (not(E(0))));
HEX(0) <= E(3) or ((not(E(2))) and E(1)) or (E(1) and (not(E(0)))) or (E(2) and (not(E(1))));

end display_arc;