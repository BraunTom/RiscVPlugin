concretize
concretizeMoveCwR
	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| word reg instrOffset |
	word := operands at: 0.
	reg := operands at: 1.
	instrOffset := (self movI: word toR: reg offset: 0).
	^ (self literalHackyValueOffset: instrOffset) * 4