as yet unclassified
bltuR1: src1 r2: src2 distance: dist offset: offset

	| instruction |
	instruction := self 
		bTypeImm: (offset bitAnd: 16r800)
		imm: (offset bitAnd: 16r3F0)
		rs2: src2 
		rs1: src1 
		funct3: 2r110
		imm: (offset bitAnd: 16rF)
		imm: (offset bitAnd: 16r400)
		opcode: 2r1100011.
	
	machineCode
		at: offset
		put: instruction.
		
	^ offset + 1