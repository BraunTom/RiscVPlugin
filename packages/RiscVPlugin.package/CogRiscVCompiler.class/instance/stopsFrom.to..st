as yet unclassified
stopsFrom: startAddr to: endAddr

	self assert: endAddr - startAddr + 1 \\ 4 = 0.
	startAddr to: endAddr by: 4 do: 
		[:addr | cogit codeLong32At: addr put: (self adaptEndianness: self stop)].