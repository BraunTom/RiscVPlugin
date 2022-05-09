instructions
addiRd: rd rs1: rs1 imm: imm offset: offset

	machineCode
		at: offset
		put: (self iTypeImm: imm rs1: rs1 funct3: 2r000 rd: rd opcode: 2r0010011).
		
	^ offset + 1