as yet unclassified
concretizeJumpBelow

	| offset leftReg rightReg |
	offset := self computeJumpTargetOffsetPlus: 0.
	leftReg := operands at: 1.
	rightReg := operands at: 2.
	
	"jump if leftReg < rightReg"
	
	^ (self bltR1: leftReg r2: rightReg distance: offset offset: 0) * 4