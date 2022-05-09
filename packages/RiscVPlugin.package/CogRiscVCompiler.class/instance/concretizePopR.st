as yet unclassified
concretizePopR

	| destReg instrOffset |
	destReg := operands at: 0.

	instrOffset := self ldOff: 0 fromRs: SP to: destReg offset: 0.
	"+ 8 as the stack grows from high to low adresses and we go it backwards"
	^ (self addiRd: SP rs1: SP imm: 8 offset: instrOffset) * 4