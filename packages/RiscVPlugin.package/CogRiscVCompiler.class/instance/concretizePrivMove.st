concretize
concretizePrivMove

	"Will get inlined into concretizeAt: switch."
	"a private operation that does not end in the hacky value for internal use; only used when generated while concretizing a non move instruction (eg a compare; see noteFollowingConditionalBranch:)"
	<inline: true>
	| word reg |
	word := operands at: 0.
	reg := operands at: 1.
	^ (self movI: word toR: reg offset: 0) * 4