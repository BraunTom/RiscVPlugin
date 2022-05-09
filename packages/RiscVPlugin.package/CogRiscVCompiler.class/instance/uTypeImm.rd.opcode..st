instruction schema
uTypeImm: immediate rd: destination opcode: opcode

	"helper for u type incoded instructions
	    31 - 12         11 - 7     6 - 0  
	imm[31:12] |     rd     | opcode"
	self 
		assert: (opcode bitAnd: 2r1111111) = opcode;
		assert: (destination bitAnd: 2r11111) = destination;
		assert: (immediate bitAnd: 2r11111111111111111111) = immediate.
	
	^ opcode
		+ (destination << 7)
		+ (immediate << 12)