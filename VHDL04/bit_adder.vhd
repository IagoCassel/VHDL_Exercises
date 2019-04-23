entity bit_adder is

port(
A, B, Ci  : in bit;
S, Co : out bit
);
end bit_adder;

architecture bit_adder_arc of bit_adder is

begin

S <= ((A XOR B) XOR Ci);
Co <= ((Ci AND (A XOR B)) OR (A AND B));

end bit_adder_arc;