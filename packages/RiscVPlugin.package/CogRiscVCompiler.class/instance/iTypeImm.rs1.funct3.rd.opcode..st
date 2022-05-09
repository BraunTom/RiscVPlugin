instruction schema
iTypeImm: immediate rs1: source1 funct3: function rd: destination opcode: opcode

	"helper for I type incoded instructions
	    31 - 20    19 - 15   14 - 12     11 - 7      6 - 0  
	imm[11:0] |   rs1    |  funct3  |     rd     | opcode"
	| unsignedImmediate |
	immediate < 0
		ifTrue: [unsignedImmediate := immediate + 16r1000]
		ifFalse: [unsignedImmediate := immediate].
		
	self 
		assert: (opcode bitAnd: 2r1111111) = opcode;
		assert: (destination bitAnd: 2r11111) = destination;
		assert: (function bitAnd: 2r111) = function;
		assert: (source1 bitAnd: 2r11111) = source1;
		assert: (unsignedImmediate bitAnd: 2r111111111111) = unsignedImmediate.
	
	^ opcode
		+ (destination << 7)
		+ (function << 12)
		+ (source1 << 15)
		+ (unsignedImmediate << 20)