as yet unclassified
concretizeXorCwR

	| destReg leftReg rightImm instrOffset |
	rightImm := operands at: 0.
	destReg := leftReg := operands at: 1.
	
	instrOffset := (self movI: rightImm toR: TempReg offset: 0).
	^ (self xorRs1: TempReg rs2: leftReg rd: destReg offset: instrOffset) * 4
	