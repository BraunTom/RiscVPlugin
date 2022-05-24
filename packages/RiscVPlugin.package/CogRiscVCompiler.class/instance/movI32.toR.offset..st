as yet unclassified
movI32: imm toR: r offset: offset

	| instrOffset |
	self assert: (imm bitAnd: 16rFFFFFFFF) = imm.
	
	instrOffset := self movI12: (imm bitAnd: 16rFFF) toR: r offset: offset.
	^ self 
		luiImm: ((imm >> 12) bitAnd: 16rFFFFF)
		toRd: r
		offset: instrOffset