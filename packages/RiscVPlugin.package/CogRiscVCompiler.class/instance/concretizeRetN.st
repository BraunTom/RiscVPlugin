concretize
concretizeRetN

	"Will get inlined into concretizeAt: switch."
	<inline: true>
	| offset |
	offset := operands at: 0.
	
	offset = 0 ifTrue: [
		"jalr x0, x1, 0"
		^ (self jalrWithRd: X0 rs1: X1 imm: 0 offset: 0) * 4].
	
	self halt.
	
	