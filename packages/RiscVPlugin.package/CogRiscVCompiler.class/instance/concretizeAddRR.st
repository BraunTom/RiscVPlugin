concretize
concretizeAddRR
	| leftReg rightReg destination |
	leftReg := operands at: 0.
	rightReg := operands at: 1.
	destination := rightReg.
	
	^ (self addR: leftReg toR: rightReg andWriteTo: destination offset: 0) * 4