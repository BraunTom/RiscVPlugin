as yet unclassified
concretizeJumpBelow

	| offset leftReg rightReg |
	offset := self computeJumpTargetOffsetPlus: 0.
	leftReg := operands at: 1.
	rightReg := operands at: 2.
	
	self halt.