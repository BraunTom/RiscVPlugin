instructions
addiRd: rd rs1: rs1 imm: imm offset: offset

	machineCode
		at: offset
		put: (self iTypeImm: imm rs1: rs1 funct3: self addiFunct rd: rd opcode: self oppImmOpcode).
		
	^ offset + 1