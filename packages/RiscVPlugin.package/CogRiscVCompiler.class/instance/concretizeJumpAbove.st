concretize
concretizeJumpAbove

	| leftReg rightReg offset |
	offset := self computeJumpTargetOffsetPlus: 0.
	leftReg := self operands at: 1.
	rightReg := self operands at: 2.
	
	^ (self bgeuR1: leftReg r2: rightReg distance: offset offset: 0) * 4