instruction schema
jTypeImm: imm20 imm: imm10 imm: imm11 imm: imm19 rd: rd opcode: opcode

	"helper for s type incoded instructions
	    31               30 - 21                 20                  19 - 12         11 - 7     6 - 0  
	imm[20] |     imm[10:1]     |    imm[11]     |  imm[19:12]   |    rd    | opcode"
	self 
		assert: (opcode bitAnd: 2r1111111) = opcode;
		assert: (rd bitAnd: 2r11111) = rd;
		assert: (imm19 bitAnd: 2r11111111) = imm19;
		assert: (imm11 bitAnd: 2r1) = imm11;
		assert: (imm10 bitAnd: 2r1111111111) = imm10;
		assert: (imm20 bitAnd: 2r1) = imm20.
	
	^opcode
		+ (rd << 7)
		+ (imm19 << 12)
		+ (imm11 << 20)
		+ (imm10 << 21)
		+ (imm20 << 31)