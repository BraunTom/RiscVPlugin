as yet unclassified
atAddress: address putLiteral: literal

	"-16 to: 0
		do: [:ea| Transcript showln: (cogit processor disassembleInstructionAt: address + (ea * 4) In: objectMemory memory)]"

	| instr currentInstruction currentAddress |
	currentAddress := address.
	instr := self instructionAt: currentAddress.
	currentInstruction := instr.
	
	(instr bitAnd: 2r1111111) = self luiOpcode
		ifTrue: [currentInstruction := (instr bitAnd: 16rFFF) + (literal bitAnd: 16rFFFFF000).
			objectMemory long32At: currentAddress put: (self adaptEndianness: currentInstruction).
			currentAddress := currentAddress - 4.
			instr := self instructionAt: currentAddress].
	
	self assert: (instr bitAnd: 2r1111111) = self oppImmOpcode.
	self assert: ((instr >> 12) bitAnd: 2r111) = self addiFunct.
	
	currentInstruction := (instr bitAnd: 16r000FFFFF) + ((literal bitAnd: 16rFFF) << 20).
	objectMemory long32At: currentAddress put: (self adaptEndianness: currentInstruction).
	
	((instr >> 15) bitAnd: 2r11111) = 0
		ifTrue: [^ literal].
	
	self flag: #Todo. "support 64 bit"
	self halt