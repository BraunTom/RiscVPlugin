instructions
slliFrom: rs1 to: rd by: shamt offset: offset

	| instruction |
	self assert: shamt < 64.

	instruction := self 
		iTypeImm:  (2r000000 << 6 ) + shamt 
		rs1: rs1 
		funct3: 001 
		rd: rd 
		opcode: 2r0010011.
		
	machineCode
		at: offset
		put: instruction.
		
	^ offset + 1