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
			^ 4 + (self calculateMoveIToROf: constant)].
		[CmpCqR] -> [^ 4].
		[JumpLess] -> [^ 4].
		[MoveMwrR] -> [^ (operands at: 0) > 16rFFF ifTrue: [16] ifFalse: [4]].
		[AddCqR] -> [| offset |
			offset := (operands at: 0).
			^ offset >= (1 << 12) 
				ifTrue: [4 + (self calculateMoveIToROf: offset)] 
				ifFalse: [4]].
		[TstCqR] -> [^ 4].
		[JumpZero] -> [^ 4].
	 	[AndCqR] -> [| offset |
			offset := (operands at: 0).
			^ offset >= (1 << 12) 
				ifTrue: [4 + (self calculateMoveIToROf: offset)] 
				ifFalse: [4]].
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
		[MoveCwR] -> [^ 4+ (self calculateMoveIToROf: (operands at: 0))].
		[CmpRR] -> [^ 4].
		[JumpBelow] -> [^ 4].
		[JumpAboveOrEqual] -> [^ 4].
		[OrCqR] -> [^ 4].
		[LoadEffectiveAddressMwrR] -> [| offset |
			offset := operands at: 0.
			^ 4 + (self calculateMoveIToROf: offset)].
		[SubRRR] -> [^ 4].
		[LogicalShiftRightCqR] -> [^ 4].
		[AddRR] -> [^ 4].
		[JumpGreater] -> [^ 4].
		[MoveRXwrR] -> [^ 12].
		[Jump] -> [^ 4].
		[JumpAbove] -> [^ 4].
		[JumpFull] -> [^ 4 + (self calculateMoveIToROf: self longJumpTargetAddress asUnsignedInteger)].
		[JumpR] -> [^ 4].
		[AlignmentNops] -> [^ 4].
		[AndCqRR] -> [| offset |
			offset := (operands at: 0).
			^ offset >= (1 << 12) 
				ifTrue: [4 + (self calculateMoveIToROf: offset)] 
				ifFalse: [4]].
		[JumpLong] -> [^ 4 + (self calculateMoveIToROf: self longJumpTargetAddress asUnsignedInteger)].
		[MoveC32R] -> [ | constant |
			constant := operands at: 0.
			^ 4 + (self calculateMoveIToROf: constant)].
		[JumpLongZero] -> [| offset |
		offset := self computeJumpTargetOffsetPlus: 0.
		^ offset < 16r1000 ifTrue: [4] ifFalse: [20]].
		[PrivMove] -> [| constant |
			constant := operands at: 0.
			^ (self calculateMoveIToROf: constant)].
		[XorCwR] -> [| constant |
			constant := operands at: 0.
			^ (self calculateMoveIToROf: constant) + 4]
		
	}.
	^ 0 "keep slang happy"