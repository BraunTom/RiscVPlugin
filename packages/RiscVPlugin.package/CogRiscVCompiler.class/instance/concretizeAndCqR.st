concretize
concretizeAndCqR

	| dest leftReg imm |
	imm := operands at: 0.
	dest := leftReg := operands at: 1.
	
	imm >= (1 << 12)
		ifTrue: [ | instrOffset |
			instrOffset := self movI: imm toR: TempReg offset: 0.
			^ (self andRs1: TempReg rs2: leftReg rd: dest offset: instrOffset) * 4].

	^ (self andImm: imm rs1: leftReg rd: dest offset: 0) * 4