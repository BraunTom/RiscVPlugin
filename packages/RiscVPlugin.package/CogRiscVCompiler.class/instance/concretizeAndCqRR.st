concretize
concretizeAndCqRR

	<inline: true>
	| val srcReg dstReg |
	val := operands at: 0.
	srcReg := operands at: 1.
	dstReg := operands at: 2.
	
	^ (self andImm: val rs1: srcReg rd: dstReg offset: 0) * 4