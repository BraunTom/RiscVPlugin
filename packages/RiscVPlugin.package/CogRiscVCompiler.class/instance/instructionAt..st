as yet unclassified
instructionAt: address

	^ self adaptEndianness: (objectMemory long32At: address)