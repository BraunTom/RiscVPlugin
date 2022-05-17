concretize
concretizeJumpR
	| reg |
	reg := operands at: 0.
	
	^ (self jalrWithRd: ZERO rs1: reg imm: 0 offset: 0) * 4