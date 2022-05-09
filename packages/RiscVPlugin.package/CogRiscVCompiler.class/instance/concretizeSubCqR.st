concretize
concretizeSubCqR

	| destReg leftReg rightImm |
	rightImm := operands at: 0.
	destReg := leftReg := operands at: 1.
	
	^ (self addiRd: destReg rs1: leftReg imm: rightImm negated offset: 0) * 4