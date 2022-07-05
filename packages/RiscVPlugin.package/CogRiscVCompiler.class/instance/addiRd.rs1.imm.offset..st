instructions
addiRd: rd rs1: rs1 imm: imm offset: offset

	self assert: (imm between: -2048 and: 2047).
	machineCode
		at: offset
		put: (self iTypeImm: imm rs1: rs1 funct3: self addiFunct rd: rd opcode: self oppImmOpcode).
		
	^ offset + 1