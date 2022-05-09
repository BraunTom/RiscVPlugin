instructions
andImm: imm rs1: source rd: destination offset: offset

	machineCode
		at: offset
		put: (self iTypeImm: imm rs1: source funct3: 2r111 rd: destination opcode: 2r0010011).
		
	^ offset + 1