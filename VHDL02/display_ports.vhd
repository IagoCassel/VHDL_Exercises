entity display_ports is

port(
SW : in bit_vector (0 to 3);
HEX : out bit_vector (0 to 6)
);

end display_ports;

architecture display of display_ports is

signal A, B, C, D, NA, NB, NC, ND: bit;

begin

D <= SW(0);
C <= SW(1);
B <= SW(2);
A <= SW(3);
ND <= not SW(0);
NC <= not SW(1);
NB <= not SW(2);
NA <= not SW(3);

HEX(0) <= (NC) or (B and D) or (A and D) or (A and B);
HEX(1) <= (NA and D) or (B and D) or (B and C) or (NA and NB and NC) or (A and C and ND);
HEX(2) <= (NA and NB) or (NB and ND) or (NA and C) or (A and B);
HEX(3) <= (NA and B) or (B and ND) or (NA and NC and D) or (NA and C and ND) or (A and NB and NC);
HEX(4) <= (NA and NC) or (NB and NC) or (NA and ND) or (B and C and ND) or (A and NB and D);
HEX(5) <= (NB and NC) or (NB and ND) or (NC and ND) or (A and C);
HEX(6) <= (NB and ND) or (B and C) or (A and NB) or (A and ND) or (NA and B and D);

end display;