entity CKT3 is

	port( A, B, C, D: in bit;
	     S1, S2: out bit);

end CKT3;

architecture CKT3_CONEC of CKT3 is

signal  C1, C2, C3, C4, C5, C6: bit;

begin
	C1 <= D or C;
	C2 <= C and B;
	C3 <= C2 and D;
	C4 <= C2 or A;
	C5 <= C3 xnor C1;
	C6 <= C3 or C4;
	S1 <= C5;
	S2 <= C6;

end CKT3_CONEC;