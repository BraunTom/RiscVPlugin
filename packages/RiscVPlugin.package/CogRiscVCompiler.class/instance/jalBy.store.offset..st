instructions
jalBy: imm store: rd offset: offset

	| instruction |
	instruction := self 
		jTypeImm: (imm bitAnd: 16r80000) >> 19
		imm: (imm bitAnd: 16r3FF)
		imm: (imm bitAnd: 16r400) >> 10
		imm: (imm bitAnd: 16r7F800) >> 11
		rd: rd 
		opcode: 2r1101111.
		
	machineCode
		at: offset
		put: instruction.
		
	^ offset + 1