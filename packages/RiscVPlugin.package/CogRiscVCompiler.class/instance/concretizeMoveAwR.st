concretize
concretizeMoveAwR
	| srcAddr destReg instrOffset |
	srcAddr := operands at: 0.
	destReg := operands at: 1.
	
	instrOffset := self movI: srcAddr toR: X28 offset: 0.
	^ (self lwOff: 0 fromRs: X28 to: destReg offset: instrOffset) * 4