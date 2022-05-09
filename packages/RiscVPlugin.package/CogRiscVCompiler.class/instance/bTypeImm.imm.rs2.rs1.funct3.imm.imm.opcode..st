instruction schema
bTypeImm: imm12 imm: imm5 rs2: rs2 rs1: rs1 funct3: funct imm: imm4 imm: imm11 opcode: opcode

	"helper for I type incoded instructions
	    31            30 - 25      24 - 20   19 - 15     14 - 12         11 - 8              7              6 - 0  
	imm[12] |  imm[10:5] |    rs2    |     rs1    |  funct3  |     imm[4:1]  |  imm[11]     | opcode"
	
	self 
		assert: (opcode bitAnd: 2r1111111) = opcode;
		assert: (imm11 bitAnd: 2r1) = imm11;
		assert: (imm4 bitAnd: 2r1111) = imm4;
		assert: (funct bitAnd: 2r111) = funct;
		assert: (rs1 bitAnd: 2r11111) = rs1;
		assert: (rs2 bitAnd: 2r11111) = rs2;
		assert: (imm5 bitAnd: 2r111111) = imm5;
		assert: (imm12 bitAnd: 2r1) = imm12.
		
	^ opcode
		+ (imm11 << 7)
		+ (imm4 << 8)
		+ (funct << 12)
		+ (rs1 << 15)
		+ (rs2 << 20)
		+ (imm5 << 25)
		+ (imm12 << 31)
	
	