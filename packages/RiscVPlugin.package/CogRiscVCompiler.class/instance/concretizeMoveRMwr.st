concretize
concretizeMoveRMwr
	<var: #offset type: #sqInt>
	| srcReg offset baseReg |
	srcReg := operands at: 0.
	offset := operands at: 1.
	baseReg := operands at: 2.
	
	^ (self storeWordFromR2: srcReg rs1: baseReg imm: 0 offset: 0) * 4