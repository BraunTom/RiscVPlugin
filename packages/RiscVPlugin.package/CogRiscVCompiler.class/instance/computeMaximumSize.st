as yet unclassified
computeMaximumSize

	self flag: #todo.
	opcode caseOf: {
		[RetN] -> [^(operands at: 0) = 0 ifTrue: [4] ifFalse: [8]].
		[MovePerfCnt64RL] -> [nil].
		[MoveRR] -> [^ 4].
		[MoveRAw] -> [ | destAddr |
			destAddr := operands at: 1.
			^ 4 + (self calculateMoveIToROf: destAddr)].
		[MoveCqR] -> [ | constant |
			constant := operands at: 0.
			^ (self calculateMoveIToROf: constant)].
		[CmpCqR] -> [^ 4].
		[JumpLess] -> [^ 4].
		[MoveMwrR] -> [^ 4].
		[AddCqR] -> [^ 4].
		[TstCqR] -> [^ 4].
		[JumpZero] -> [^ 4].
	 	[AndCqR] -> [^ 4].
		[MoveMbrR] -> [^ 4].
		[JumpNonZero] -> [^ 4].
		[MoveM16rR] -> [^ 4].
		[SubRR] -> [^ 4].
		[Label] -> [^ 0].
		[MoveXwrRR] -> [^ 12].
		[NegateR] -> [^ 4].
		[LogicalShiftLeftCqR] -> [^ 4].
		[MoveAwR] -> [| destAddr |
			destAddr := operands at: 0.
			^ 4 + (self calculateMoveIToROf: destAddr)].
		[SubCqR] -> [^ 4].
		[PushR] -> [^ 8].
		[Call] -> [^ 4].
		[CallFull] -> [| offset |
			offset := operands at: 0.^ 4 + (self calculateMoveIToROf: offset)].
		[PopR] -> [^ 8].
		[MoveRMwr] -> [^ 4].
		[MoveCwR] -> [^ (self calculateMoveIToROf: (operands at: 0))].
		[CmpRR] -> [^ 4].
		[JumpBelow] -> [^ 4].
		[JumpAboveOrEqual] -> [^ 4].
		[OrCqR] -> [^ 4].
		[LoadEffectiveAddressMwrR] -> [| offset |
			offset := operands at: 0.^ 4 + (self calculateMoveIToROf: offset)].
		[SubRRR] -> [^ 4].
		[LogicalShiftRightCqR] -> [^ 4].
		[AddRR] -> [^ 4].
		[JumpGreater] -> [^ 4].
		[MoveRXwrR] -> [^ 12].
		[Jump] -> [^ 4].
		[JumpAbove] -> [^ 4].
		
	}.
	^ 0 "keep slang happy"