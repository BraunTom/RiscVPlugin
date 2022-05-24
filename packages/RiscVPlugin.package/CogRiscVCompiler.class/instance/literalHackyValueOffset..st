as yet unclassified
literalHackyValueOffset: offset
	
	machineCode
		at: offset
		put: self literalHackyValue.
		
	^ offset + 1