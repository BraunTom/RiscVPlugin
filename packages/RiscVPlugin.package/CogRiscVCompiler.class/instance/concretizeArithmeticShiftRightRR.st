concretize
concretizeArithmeticShiftRightRR
	| shiftReg valueReg destReg |
	shiftReg := operands at: 0.
	valueReg := destReg := operands at: 1.
	
	^ (self sraShiftReg: shiftReg rs: valueReg rd: destReg offset: 0) * 4.
	
	