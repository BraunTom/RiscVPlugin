instructions
andRs1: rs1 rs2: rs2 rd: rd offset: offset

	machineCode
		at: offset
		put: (self rTypeFunct: 2r0000000 rs2: rs2 rs1: rs1 funct: 2r111 rd: rd opcode: 2r0110011).
		
	^ offset + 1