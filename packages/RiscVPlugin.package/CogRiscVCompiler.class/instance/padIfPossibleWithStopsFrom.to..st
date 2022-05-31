as yet unclassified
padIfPossibleWithStopsFrom: startAddr to: endAddr
	
	startAddr to: endAddr - 1 by: 4 do: 
		[:addr | objectMemory long32At: addr put: (self adaptEndianness: self stop)].