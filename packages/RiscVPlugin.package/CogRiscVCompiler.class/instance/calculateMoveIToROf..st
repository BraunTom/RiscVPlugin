as yet unclassified
calculateMoveIToROf: aNumber

	| imm |
	imm := aNumber.
	(self isAnInstruction: imm) ifTrue: [imm := aNumber address].
	imm negative ifTrue: [^ 20].
	^ (imm < 16r1000 ifTrue: [4] ifFalse: [imm < 16r100000000 ifTrue: [8] ifFalse: [20]])