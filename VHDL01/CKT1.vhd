entity CKT1 is

	port( A, B, C, D: in bit;
	     S1, S2: out bit);

end CKT1;

architecture CKT1_CONEC of CKT1 is

signal  C1, C2, C3, C4, C5, C6: bit;

begin
	C1 <= A or B;
	C2 <= B xnor C;
	C3 <= C2 and A;
	C4 <= C2 or D;
	C5 <= C3 xor C1;
	C6 <= C3 or C4;
	S1 <= C5;
	S2 <= C6;

end CKT1_CONEC;