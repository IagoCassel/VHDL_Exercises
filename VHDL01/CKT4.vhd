entity CKT4 is

	port( A, B, C, D: in bit;
	     S1, S2: out bit);

end CKT4;

architecture CKT4_CONEC of CKT4 is

signal  C1, C2, C3, C4, C5, C6: bit;

begin
	C1 <= D xor C;
	C2 <= C or B;
	C3 <= C2 or D;
	C4 <= C2 xor A;
	C5 <= C3 xnor C1;
	C6 <= C3 or C4;
	S1 <= C5;
	S2 <= C6;

end CKT4_CONEC;