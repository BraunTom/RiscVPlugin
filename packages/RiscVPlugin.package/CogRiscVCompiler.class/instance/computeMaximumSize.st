as yet unclassified
computeMaximumSize

	self flag: #todo.
	opcode caseOf: {
		[RetN] -> [^(operands at: 0) = 0 ifTrue: [4] ifFalse: [8]].
		[MovePerfCnt64RL] -> [nil].
		[MoveRR] -> [^ 4].
		[MoveRAw] -> [ | destAddr |
			destAddr := operands at: 1.
			^ 4 + (destAddr < 16r1000 ifTrue: [4] ifFalse: [destAddr < 16r100000000 ifTrue: [8] ifFalse: [20]])].
		[MoveCqR] -> [ | constant |
			constant := operands at: 0.
			^ (constant < 16r1000 ifTrue: [4] ifFalse: [constant < 16r100000000 ifTrue: [8] ifFalse: [20]])].
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
			^ 4 + (destAddr < 16r1000 ifTrue: [4] ifFalse: [destAddr < 16r100000000 ifTrue: [8] ifFalse: [20]])].
		[SubCqR] -> [^ 4].
		[PushR] -> [^ 8].
		[Call] -> [^ 4].
		[CallFull] -> [| offset |
			offset := operands at: 0.^ 4 + (offset < 16r1000 ifTrue: [4] ifFalse: [offset < 16r100000000 ifTrue: [8] ifFalse: [20]])].
		[PopR] -> [^ 8].
		[MoveRMwr] -> [^ 4].
		[MoveCwR] -> [^ 4].
		[CmpRR] -> [^ 4].
		[JumpBelow] -> [^ 4].
		[JumpAboveOrEqual] -> [^ 4].
		
	}.
	^ 0 "keep slang happy"