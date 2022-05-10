concretize
concretizeLoadSubRRR

	| r1 r2 dest |
	r1 := operands at: 0.
	r2 := operands at: 0.
	dest := operands at: 0.
	
	^ (self subR: r2 fromR: r1 andWriteTo: dest offset: 0) * 4
	
	
	