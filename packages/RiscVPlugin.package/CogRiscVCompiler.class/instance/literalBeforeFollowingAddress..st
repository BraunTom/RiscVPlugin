inline cacheing
literalBeforeFollowingAddress: followingAddress
	"Answer the constant loaded by the instruction sequence just before this address:"
	
	"
	-16 to: 0
		do: [:ea| Transcript showln: (cogit processor disassembleInstructionAt: followingAddress + (ea * 4) In: objectMemory memory)]
		cogit processor disassembleInstructionAt: followingAddress - 4 In: objectMemory memory
		"
		
	1 to: self machineCodeWords 
		do: [:each | | instr currentAddress |
			currentAddress := followingAddress - (each * 4).
			instr := self adaptEndianness: (objectMemory long32At: currentAddress).
			instr = self literalHackyValue
				ifTrue: [^ self literalAtAdress: currentAddress - 4]].
		
	self halt.