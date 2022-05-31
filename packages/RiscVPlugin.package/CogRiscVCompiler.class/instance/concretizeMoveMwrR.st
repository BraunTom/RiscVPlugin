concretize
concretizeMoveMwrR
	"Will get inlined into concretizeAt: switch."
	
	<var: #offset type: #sqInt>
	<inline: true>
	| srcReg offset destReg|
	offset := operands at: 0.
	srcReg := operands at: 1.
	destReg := operands at: 2.
	
	offset > 16rFFF
		ifTrue: [| instrOffset |
			self assert: (offset bitAnd: 16rFFFFFFFF) = offset.
			instrOffset := self movI: offset toR: TempReg offset: 0.
			instrOffset := self addR: srcReg toR: TempReg andWriteTo: TempReg offset: instrOffset.
			^ (self lwOff: 0 fromRs: TempReg to: destReg offset: instrOffset) * 4]
		ifFalse: [^ (self lwOff: offset fromRs: srcReg to: destReg offset: 0) * 4]
	
	