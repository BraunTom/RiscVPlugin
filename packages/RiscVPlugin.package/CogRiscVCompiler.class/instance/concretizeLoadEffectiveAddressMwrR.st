concretize
concretizeLoadEffectiveAddressMwrR

	| baseReg offset destReg instrOffset |
	offset := operands at: 0.
	baseReg := operands at: 1.
	destReg := operands at: 2.
	
	instrOffset := self movI: offset toR: TempReg offset: 0.
	^ (self addR: TempReg toR: baseReg andWriteTo: destReg offset: instrOffset) * 4
	