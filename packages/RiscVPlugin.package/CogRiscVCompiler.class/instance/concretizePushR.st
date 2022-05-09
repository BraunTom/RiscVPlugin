concretize
concretizePushR
	
	| srcReg instrOffset |
	srcReg := operands at: 0.
	"Reg[Sp] = Reg[SP] - 8;   go the 64 bit(register width) down"
	instrOffset := self addiRd: SP rs1: SP imm: -8 offset: 0.
	"store regsiter"
	instrOffset := self storeDoubleWordFromR2: srcReg rs1: SP imm: 0 offset: instrOffset.
	^ instrOffset * 4