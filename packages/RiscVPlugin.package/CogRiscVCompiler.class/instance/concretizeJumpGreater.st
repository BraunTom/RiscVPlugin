concretize
concretizeJumpGreater

	| leftReg rightReg targetOffset |
	targetOffset := self computeJumpTargetOffsetPlus: 0.
	leftReg := self operands at: 1.
	rightReg := self operands at: 2.
	
	"Jump if leftReg > rightReg"
	
	"Note that leftReg and rightReg need to switch places here, we only have a 'Less than' operand in RISC-V"
	^ (self bltR1: rightReg r2: leftReg distance: targetOffset offset: 0) * 4