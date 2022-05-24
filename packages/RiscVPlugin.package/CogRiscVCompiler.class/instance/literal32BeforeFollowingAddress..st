inline cacheing
literal32BeforeFollowingAddress: followingAddress
	"Answer the constant loaded by the instruction sequence just before this address:"
	
	"
	-16 to: 0
		do: [:ea| Transcript showln: (cogit processor disassembleInstructionAt: followingAddress + (ea * 4) In: objectMemory memory)]
	"
	^ self literalAtAdress: followingAddress - 4