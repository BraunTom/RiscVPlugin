concretize
concretizeCall
	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| offset |
	offset := (operands at: 0).
	self assert: offset ~= 0.
	self assert: offset \\ 4 = 0.

	self assert: (self isInImmediateJumpRange: offset).
	^ (self jalBy: offset store: LinkReg offset: 0) * 4
