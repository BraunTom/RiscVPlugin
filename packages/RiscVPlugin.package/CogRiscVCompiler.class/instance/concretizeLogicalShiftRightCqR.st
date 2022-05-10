concretize
concretizeLogicalShiftRightCqR
	| distance reg |
	distance := operands at: 0.
	reg := operands at: 1.
	
	^ (self srlImm: distance rs: reg rd: reg offset: 0) * 4
	
	