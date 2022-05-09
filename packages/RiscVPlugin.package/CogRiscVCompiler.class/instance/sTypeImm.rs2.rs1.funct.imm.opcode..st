instruction schema
sTypeImm: imm1 rs2: rs2 rs1:rs1 funct: funct imm: imm2 opcode: opcode

	"helper for s type incoded instructions
	    31 - 25     24 - 20     19 - 15   14 - 12      11 - 7          6 - 0  
	imm[11:5] |     rs2     |    rs1    |  funct3  |  imm[4:0]  | opcode"
	self 
		assert: (opcode bitAnd: 2r1111111) = opcode;
		assert: (imm2 bitAnd: 2r11111) = imm2;
		assert: (funct bitAnd: 2r111) = funct;
		assert: (rs1 bitAnd: 2r11111) = rs1;
		assert: (rs2 bitAnd: 2r11111) = rs2;
		assert: (imm1 bitAnd: 2r1111111) = imm1.
	
	^opcode
		+ (imm2 << 7)
		+ (funct << 12)
		+ (rs1 << 15)
		+ (rs2 << 20)
		+ (imm1 << 25)