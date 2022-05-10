instructions
oriImm: imm withR1: r1 to: rd offset: offset

	machineCode
		at: offset
		put: (self iTypeImm: imm rs1: r1 funct3: 2r110 rd: rd opcode: 2r0010011).
		
	^ offset + 1