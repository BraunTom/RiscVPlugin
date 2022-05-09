concretize
concretizeMoveM16rR
	"Will get inlined into concretizeAt: switch."
	
	<var: #offset type: #sqInt>
	<inline: true>
	| srcReg offset destReg|
	offset := operands at: 0.
	srcReg := operands at: 1.
	destReg := operands at: 2.
	
	^ (self lhOff: offset fromRs: srcReg to: destReg offset: 0) * 4