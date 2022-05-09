concretize
concretizeMoveRAw

	<inline: true>
	| srcReg destAddr instrOffset |
	srcReg := operands at: 0.
	destAddr := operands at: 1.
	
	instrOffset := self movI: destAddr toR: A0 offset: 0.
	^ (self storeDoubleWordFromR2: srcReg rs1: A0 imm: 0 offset: instrOffset) * 4