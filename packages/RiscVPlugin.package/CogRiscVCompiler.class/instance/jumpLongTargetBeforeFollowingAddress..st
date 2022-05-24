inline cacheing
jumpLongTargetBeforeFollowingAddress: mcpc

	0 to: self machineCodeWords 
		do: [:each | | instr currentAddress |
			currentAddress := mcpc - (each * 4).
			instr := self adaptEndianness: (objectMemory long32At: currentAddress).
			(instr bitAnd: 2r1111111) = self jalrOpcode
				ifTrue: [^ self literalAtAdress: currentAddress - 4]].
		
	self halt.