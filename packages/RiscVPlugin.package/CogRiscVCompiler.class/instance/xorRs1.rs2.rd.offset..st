as yet unclassified
xorRs1: rs1 rs2: rs2 rd: rd offset: offset

	| instr |
	instr := self rTypeFunct: 2r0000000 rs2: rs2 rs1: rs1 funct: 2r100 rd: rd opcode: 2r0110011.

	machineCode 
		at: offset
		put: instr.
		
	^ offset + 1