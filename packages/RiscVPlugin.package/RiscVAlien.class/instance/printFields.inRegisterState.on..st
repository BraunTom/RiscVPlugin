as yet unclassified
printFields: fields inRegisterState: registerStateVector on: aStream
	| rsvs |
	aStream ensureCr.
	rsvs := registerStateVector readStream.
	fields withIndexDo:
		[:sym :index| | val |
		sym = #cr
			ifTrue: [aStream cr]
			ifFalse:
				[(val := rsvs next) isNil ifTrue: [^self].
				aStream nextPutAll: sym; nextPut: $:; space.
				val printOn: aStream base: 16 length: 8 padded: true.
				val > 16 ifTrue:
					[aStream space; nextPut: $(.
					 val printOn: aStream base: 10 length: 1 padded: false.
					 aStream nextPut: $)].
				(fields at: index + 1) ~~ #cr ifTrue:
					[aStream tab]]]