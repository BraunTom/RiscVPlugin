instructions
srlImm: distance rs: rs rd: rd offset: offset

	self assert: distance < 64.
	
	machineCode
		at: offset
		put: (self iTypeImm: (distance bitAnd: 2r111111)  rs1: rs funct3: 2r101 rd: rd opcode: 2r0010011).
	^ offset + 1