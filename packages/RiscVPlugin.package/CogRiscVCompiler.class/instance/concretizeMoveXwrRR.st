concretize
concretizeMoveXwrRR
	"Will get inlined into concretizeAt: switch."
	
	<inline: true>
	| index base dest instrOffset |
	index := operands at: 0.
	base := operands at: 1.
	dest := operands at: 2.
	
	"R[dest] = Mem[base + index * 8]"
	
	"X28 = index * 4"
	instrOffset := self slliFrom: index to: X28 by: 3 offset: 0.
	"X28 = base + X28"
	instrOffset := self addR: base toR: X28 andWriteTo: X28 offset: instrOffset.
	"R[dest] = Mem[X28]"
	instrOffset := self lwOff: 0 fromRs: X28 to: dest offset: instrOffset.
	
	^ instrOffset * 4