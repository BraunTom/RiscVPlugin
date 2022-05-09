concretize
concretizeAndCqR

	| dest leftReg imm |
	imm := operands at: 0.
	dest := leftReg := operands at: 1.

	^ (self andImm: imm rs1: leftReg rd: dest offset: 0) * 4