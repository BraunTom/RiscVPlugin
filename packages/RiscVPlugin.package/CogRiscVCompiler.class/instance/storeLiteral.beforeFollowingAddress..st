inline cacheing
storeLiteral: literal beforeFollowingAddress: followingAddress
	"Rewrite the long constant loaded by the instruction sequence just before this address:"
	
	1 to: self machineCodeWords 
		do: [:each | | instr currentAddress |
			currentAddress := followingAddress - (each * 4).
			instr := self adaptEndianness: (objectMemory long32At: currentAddress).
			instr = self literalHackyValue
				ifTrue: [^ self atAddress: currentAddress - 4 putLiteral: literal]] .
		
	self halt.

	