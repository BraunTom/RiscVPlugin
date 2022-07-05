instructions
sraShiftReg: shiftReg rs: rs rd: rd offset: offset

	machineCode
		at: offset
		put: (self rTypeFunct: 2r0100000 rs2: shiftReg rs1: rs funct: 2r101 rd: rd opcode: 2r0110011).
	^ offset + 1