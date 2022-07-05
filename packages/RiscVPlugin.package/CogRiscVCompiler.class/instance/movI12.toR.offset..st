as yet unclassified
movI12: imm toR: r offset: offset

	"Risc-V will sign-extend any negative values to the full 64 bit."
	self assert: (imm between: -2048 and: 2047).
	^ self addiRd: r rs1: X0 imm: imm offset: offset. "register[11:0] = bits[11:0]"