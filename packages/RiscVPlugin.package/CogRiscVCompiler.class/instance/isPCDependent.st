testing
isPCDependent
	"Answer if the receiver is a pc-dependent instruction."
	self flag: #todo.
	^self isJump or: [opcode = AlignmentNops or: [opcode = RetN]]