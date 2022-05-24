as yet unclassified
literalAtAdress: address

	| instr currentAddress literal |
	literal := 0.
	currentAddress := address.
	instr := self instructionAt: currentAddress.
	
	(instr bitAnd: 2r1111111) = self luiOpcode
		ifTrue: [literal := (instr bitAnd: 16rFFFFF000).
			currentAddress := currentAddress - 4.
			instr := self instructionAt: currentAddress].
	
	self assert: (instr bitAnd: 2r1111111) = self oppImmOpcode.
	self assert: ((instr >> 12) bitAnd: 2r111) = self addiFunct.
	
	literal :=  literal + (instr >> 20).
	
	((instr >> 15) bitAnd: 2r11111) = 0
		ifTrue: [^ literal].
	
	self flag: #Todo. "support 64 bit"
	self halt
		