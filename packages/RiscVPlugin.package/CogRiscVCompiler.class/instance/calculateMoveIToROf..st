as yet unclassified
calculateMoveIToROf: aNumber

	aNumber negative ifTrue: [^ 20].
	^ (aNumber < 16r1000 ifTrue: [4] ifFalse: [aNumber < 16r100000000 ifTrue: [8] ifFalse: [20]])