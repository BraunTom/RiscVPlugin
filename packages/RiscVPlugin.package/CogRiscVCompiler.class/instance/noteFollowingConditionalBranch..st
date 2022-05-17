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
						 newBranchRight := TempReg.
						 "move constant into TempReg"
						 opcode := MoveCqR.
						 operands at: 1 put: TempReg].
		[CmpRR]	-> 	["just give the two registers to the next instruction"
						newBranchLeft := operands at: 0.
						 newBranchRight :=operands at: 1.
						opcode := Label].
		[TstCqR] -> [newBranchLeft := TempReg.
						 newBranchRight := ZERO.
						"move constant into TempReg"
						 opcode := MoveCqR.
						 operands at: 0 put: TempReg].
		[AndCqRR] -> [newBranchLeft := operands at: 2.
						 newBranchRight := ZERO].
		[CmpC32R] -> [newBranchLeft := operands at: 1.
						 newBranchRight := TempReg.
						 opcode := MoveC32R.
						 operands at: 1 put: TempReg].
	} otherwise: [self unreachable].

	branch rewriteOpcode: branch opcode with: newBranchLeft with: newBranchRight.
	^branch