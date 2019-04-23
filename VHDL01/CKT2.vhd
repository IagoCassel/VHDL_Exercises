entity CKT2 is

	port( A, B, C, D: in bit;
	     S1, S2: out bit);

end CKT2;

architecture CKT2_CONEC of CKT2 is

signal  C1, C2, C3, C4, C5, C6: bit;

begin
	C1 <= A xor B;
	C2 <= B xnor C;
	C3 <= C2 and A;
	C4 <= C2 xor D;
	C5 <= C3 and C1;
	C6 <= C3 or C4;
	S1 <= C5;
	S2 <= C6;

end CKT2_CONEC;