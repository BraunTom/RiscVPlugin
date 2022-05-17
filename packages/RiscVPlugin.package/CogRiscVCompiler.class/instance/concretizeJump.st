concretize
concretizeJump

	| offset |
	offset := self computeJumpTargetOffsetPlus: 4.
	
	^ (self jalBy: offset store: ZERO offset: 0) * 4