concretize
concretizeNegateR

	| reg |
	reg := operands at: 0.
	^ (self subR: reg fromR: ZERO andWriteTo: reg offset: 0) * 4