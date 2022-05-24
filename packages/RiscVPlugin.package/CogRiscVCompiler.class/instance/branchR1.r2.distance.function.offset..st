as yet unclassified
branchR1: src1 r2: src2 distance: dist function: funct offset: offset

	| instruction distance |
	distance := dist.
	distance < 0
	 	ifTrue: [distance := distance bitAnd: 16rFFF].	
	self assert: (distance bitAnd: 16rFFF) = distance.
	
	instruction := self 
		bTypeImm: ((distance bitAnd: 16r800) >> 11)
		imm: (distance bitAnd: 16r3F0) >> 4
		rs2: src2 
		rs1: src1 
		funct3: funct 
		imm: (distance bitAnd: 16rF)
		imm: ((distance bitAnd: 16r400) >> 10)
		opcode: self branchOpcode.
	
	machineCode
		at: offset
		put: instruction.
		
	^ offset + 1