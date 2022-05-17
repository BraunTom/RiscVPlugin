concretize
concretizeRetN

	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| offset instrOffset |
	offset := operands at: 0.
	
	offset = 0 ifTrue: [
		"jalr x0, x1, 0"
		^ (self jalrWithRd: ZERO rs1: LinkReg imm: 0 offset: 0) * 4].
	
	self assert: offset < 255.
	instrOffset := self addiRd: SP rs1: SP imm: offset offset: 0.
	^ (self jalrWithRd: ZERO rs1: LinkReg imm: offset offset: instrOffset) * 4
	
	