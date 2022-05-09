abstract instructions
noteFollowingConditionalBranch: branch
	"Support for processors without condition codes, such as the MIPS.
	 Answer the branch opcode.  If there are no condition codes, modify
	 the receiver and the branch to implement a suitable conditional
	 branch that doesn't depend on condition codes being set by the
	 receiver.  By default a noop. Overridden in subclasses as required."
	<returnTypeC: #'AbstractInstruction *'>
	<var: #branch type: #'AbstractInstruction *'>
	<inline: true>
	| newBranchLeft newBranchRight |
	
	opcode caseOf: {
		[CmpCqR]	-> 	["the next branch will compare the current given register and the register we move the constant into"
						newBranchLeft := operands at: 1.
						 newBranchRight := X28.
						 "move constant into X28"
						 opcode := MoveCqR.
						 operands at: 1 put: X28].
		[CmpRR]	-> 	["just give the two registers to the next instruction"
						newBranchLeft := operands at: 0.
						 newBranchRight :=operands at: 1.
						opcode := Label].
		[TstCqR] -> [newBranchLeft := X28.
						 newBranchRight := ZERO.
						"move constant into X28"
						 opcode := MoveCqR.
						 operands at: 0 put: X28]
	} otherwise: [self unreachable].

	branch rewriteOpcode: branch opcode with: newBranchLeft with: newBranchRight.
	^branch