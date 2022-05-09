concretize
concretizeMoveRR

	<inline: true>
	| srcReg destReg |
	srcReg := operands at: 0.
	destReg := operands at: 1.
	
	^ (self movR: srcReg toR: destReg offset: 0) * 4.