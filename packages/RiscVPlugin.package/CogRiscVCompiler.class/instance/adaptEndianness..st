as yet unclassified
adaptEndianness: a32BitInteger

	| lowPart highPart |
	self assert: (a32BitInteger bitAnd: 16rFFFFFFFF) = a32BitInteger.
	
	lowPart := a32BitInteger bitAnd: 16rFFFF.
	highPart := a32BitInteger bitAnd: 16rFFFF0000.
	
	^ ((lowPart bitAnd: 16rFF) << 8) 
		+ ((lowPart bitAnd: 16rFF00) >> 8)
		+ ((highPart bitAnd: 16rFF0000) << 8) 
		+ ((highPart bitAnd: 16rFF000000) >> 8)