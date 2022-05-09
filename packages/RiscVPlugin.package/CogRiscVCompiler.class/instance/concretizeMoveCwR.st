concretize
concretizeMoveCwR
	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| word reg |
	word := operands at: 0.
	reg := operands at: 1.
	^ (self movI: word toR: reg offset: 0) * 4