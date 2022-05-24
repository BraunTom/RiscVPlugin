as yet unclassified
movI64: imm toR: r offset: offset

	| instrOffset |
	self assert: (imm bitAnd: 16rFFFFFFFFFFFFFFFF) = imm.
	
	instrOffset := self movI32: ((imm >> 32) bitAnd: 16rFFFFFFFF) toR: r offset: offset.
	instrOffset := self slliFrom: r to: r by: 32 offset: instrOffset.
	instrOffset := self addiRd: r rs1: r imm: (imm bitAnd: 16rFFF) offset: instrOffset.
	^ self luiImm: ((imm >> 12) bitAnd: 16rFFFFF) toRd: r offset: instrOffset
	