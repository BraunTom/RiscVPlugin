concretize
concretizeJumpLongZero

	| leftReg rightReg offset |
	offset := self longJumpTargetAddress.
	leftReg := self operands at: 1.
	rightReg := self operands at: 2.

	offset < 16r1000
		"jump if equal"
		ifTrue: [^ (self beqR1: leftReg r2: rightReg distance: offset offset: 0) * 4]
		"if not equal jump to nop; otherwise go into jal"
		ifFalse: [ | instrOffset |
			instrOffset := (self bneR1: leftReg r2: rightReg distance: 4 offset: 0).
			"lets hope the given offset is not bigger than 32 bit, otherwise the rewriting of this intruction later on will be way more complicated"
			self assert: (offset bitAnd: 16rFFFFFFFF) = offset.
			instrOffset := (self movI: offset toR: TempReg offset: instrOffset).
			instrOffset := (self jalrWithRd: ZERO rs1: TempReg imm: 0 offset: instrOffset).
			^ (self nopOffset: instrOffset) * 4]