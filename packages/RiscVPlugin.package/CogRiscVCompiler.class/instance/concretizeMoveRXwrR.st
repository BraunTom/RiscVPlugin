concretize
concretizeMoveRXwrR
	"base <- src[index * wordSize]"
	
	| srcReg indexReg baseReg offset |
	srcReg := operands at: 0.
	indexReg := operands at: 1.
	baseReg := operands at: 2.
	
	offset := self slliFrom: indexReg to: indexReg by: 3 offset: 0. "index * wordSize (8)"
	offset := self addR: indexReg toR: srcReg andWriteTo: srcReg offset: offset. "src[...]"
	offset := self ldOff: 0 fromRs: srcReg to: baseReg offset: offset. "base <- ..."
	^ offset * 4