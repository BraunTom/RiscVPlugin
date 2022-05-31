as yet unclassified
dispatchConcretize

	self flag: #todo.
	opcode caseOf: {
		[RetN] -> [^self concretizeRetN].
		[MovePerfCnt64RL] -> [^ self concretizeMovePerfCnt64RL].
		[MoveRR] -> [^ self concretizeMoveRR].
		[MoveRAw] -> [^ self concretizeMoveRAw].
		[CmpCqR] -> [^ self concretizeCmpCqR].
		[MoveCqR] -> [^ self concretizeMoveCqR].
		[MoveMwrR] -> [^ self concretizeMoveMwrR].
		[AddCqR] -> [^ self concretizeAddCqR].
		[AndCqR] -> [^ self concretizeAndCqR].
		[MoveMbrR] -> [^ self concretizeMoveMbrR].
		[MoveM16rR] -> [^ self concretizeMoveM16rR].
		[SubRR] -> [^ self concretizeSubRR].
		[Label] -> [^ self concretizeLabel].
		[MoveXwrRR] -> [^ self concretizeMoveXwrRR].
		[NegateR] -> [^ self concretizeNegateR].
		[LogicalShiftLeftCqR] -> [^ self concretizeLogicalShiftLeftCqR].
		[MoveAwR] -> [^ self concretizeMoveAwR].
		[SubCqR] -> [^ self concretizeSubCqR].
		[JumpLess] -> [^ self concretizeJumpLess].
		[JumpZero] -> [^ self concretizeJumpZero].
		[JumpNonZero] -> [^ self concretizeJumpNonZero].
		[PushR] -> [^ self concretizePushR].
		[Call] -> [^ self concretizeCall].
		[CallFull] -> [^ self concretizeCallFull].
		[PopR] -> [^ self concretizePopR].
		[MoveRMwr] -> [^ self concretizeMoveRMwr].
		[MoveCwR] -> [^ self concretizeMoveCwR].
		[JumpBelow] -> [^ self concretizeJumpBelow].
		[JumpAboveOrEqual] -> [^ self concretizeJumpAboveOrEqual].
		[OrCqR] -> [^ self concretizeOrCqR].
		[LoadEffectiveAddressMwrR] -> [^ self concretizeLoadEffectiveAddressMwrR].
		[SubRRR] -> [^ self concretizeLoadSubRRR].
		[LogicalShiftRightCqR] -> [^ self concretizeLogicalShiftRightCqR].
		[AddRR] -> [^ self concretizeAddRR].
		[MoveRXwrR] -> [^ self concretizeMoveRXwrR].
		[JumpGreater] -> [^ self concretizeJumpGreater].
		[Jump] -> [^ self concretizeJump].
		[JumpAbove] -> [^ self concretizeJumpAbove].
		[JumpFull] -> [^ self concretizeJumpFull].
		[JumpR] -> [^ self concretizeJumpR].
		[AndCqRR] -> [^ self concretizeAndCqRR].
		[AlignmentNops] -> [^ self concretizeAlignmentNops].
		[MoveC32R] -> [^ self concretizeMoveCwR].
		[JumpLong] -> [^ self concretizeJumpFull].
		[JumpLongZero] -> [^ self concretizeJumpLongZero].
		[PrivMove] -> [^ self concretizePrivMove].
		[XorCwR] -> [^ self concretizeXorCwR].
	}.
	^ 0 "keep slang happy"