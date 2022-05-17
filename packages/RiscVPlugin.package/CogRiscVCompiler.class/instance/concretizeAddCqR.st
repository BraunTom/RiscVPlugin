concretize
concretizeAddCqR
	| destReg leftReg rightImm |
	rightImm := operands at: 0.
	destReg := leftReg := operands at: 1.
	
	rightImm >= (1 << 12)
		ifTrue: [ | instrOffset |
			instrOffset := self movI: rightImm toR: TempReg offset: 0.
			^ (self addR: leftReg toR: TempReg andWriteTo: destReg offset: instrOffset) * 4].
	
	^ (self addiRd: destReg rs1: leftReg imm: rightImm offset: 0) * 4