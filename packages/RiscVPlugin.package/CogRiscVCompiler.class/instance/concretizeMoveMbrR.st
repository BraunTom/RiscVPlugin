concretize
concretizeMoveMbrR
	"N.B. we zero-extend because we state byteReadsZeroExtend."
	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| srcReg offset destReg |
	offset := operands at: 0.
	srcReg := operands at: 1.
	destReg := operands at: 2.
	
	^ (self lbOff: offset fromRs: srcReg to: destReg offset: 0) * 4