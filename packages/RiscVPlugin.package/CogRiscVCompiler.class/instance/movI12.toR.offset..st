as yet unclassified
movI12: imm toR: r offset: offset

	self assert: (imm bitAnd: 16rFFF) = imm.
	^ self addiRd: r rs1: X0 imm: imm offset: offset. "register[11:0] = bits[11:0]"