instruction schema
rTypeFunct: funct7 rs2: rs2 rs1:rs1 funct: funct3 rd: rd opcode: opcode

	"helper for r type incoded instructions
	 31 - 25  24 - 20    19 - 15   14 - 12    11 - 7     6 - 0  
	funct7 |     rs2     |    rs1    |  funct3  |   rd    | opcode"
	self 
		assert: (opcode bitAnd: 2r1111111) = opcode;
		assert: (rd bitAnd: 2r11111) = rd;
		assert: (funct3 bitAnd: 2r111) = funct3;
		assert: (rs1 bitAnd: 2r11111) = rs1;
		assert: (rs2 bitAnd: 2r11111) = rs2;
		assert: (funct7 bitAnd: 2r1111111) = funct7.
	
	^opcode
		+ (rd << 7)
		+ (funct3 << 12)
		+ (rs1 << 15)
		+ (rs2 << 20)
		+ (funct7 << 25)