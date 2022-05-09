concretize
concretizeCallFull
	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| offset instrOffset |
	offset := (operands at: 0).

	instrOffset := self movI: offset toR: X7 offset: 0.
	^ (self jalrWithRd: LinkReg rs1: X7 imm: 0 offset: instrOffset) * 4
