concretize
concretizeSubRR

	| leftReg rightReg destReg |
	rightReg := operands at: 0.
	destReg := leftReg := operands at: 1.
	
	self flag: #Todo. "not sure if I got the order right"
	^ (self subR: leftReg fromR: rightReg andWriteTo: destReg offset: 0) * 4