concretize
concretizeOrCqR
	| destReg leftReg rightImm |
	rightImm := operands at: 0.
	destReg := leftReg := operands at: 1.
	
	^ (self oriImm: rightImm withR1: leftReg to: destReg offset: 0) * 4