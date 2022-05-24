as yet unclassified
literalHackyValue
	"constant effective nop with a fixed immediate used for extracting literals; 
	needed by literalBeforeFollowingAddress:"

	^ self iTypeImm: 32 rs1: ZERO funct3: self addiFunct rd: ZERO opcode: self oppImmOpcode