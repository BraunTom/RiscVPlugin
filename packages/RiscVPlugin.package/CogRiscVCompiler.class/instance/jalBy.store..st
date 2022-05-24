instructions
jalBy: imm store: rd

	| signedImm |
	signedImm := imm.
	imm < 0 ifTrue: [signedImm := (signedImm bitAnd: 16rFFFFF) ].
	self assert: (signedImm bitAnd: 16rFFFFF) = signedImm.

	^ self 
		jTypeImm: (signedImm bitAnd: 16r80000) >> 19
		imm: (signedImm bitAnd: 16r3FF)
		imm: (signedImm bitAnd: 16r400) >> 10
		imm: (signedImm bitAnd: 16r7F800) >> 11
		rd: rd 
		opcode: 2r1101111