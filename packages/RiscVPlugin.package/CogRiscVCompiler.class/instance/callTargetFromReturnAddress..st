as yet unclassified
callTargetFromReturnAddress: callSiteReturnAddress

	"
	-16 to: 0
		do: [:ea| Transcript showln: (cogit processor disassembleInstructionAt: callSiteReturnAddress + (ea * 4) In: objectMemory memory)]
		self adaptEndianness: (objectMemory long32At: callSiteReturnAddress + (-1 * 4))
	"
	| instr literalPart literal |
	instr := self adaptEndianness: (objectMemory long32At: callSiteReturnAddress - 4).
	literalPart := instr >> 12.
	
	literal := ((literalPart >> 9) bitAnd: 16r3FF) + (((literalPart >> 8) bitAnd: 1) << 10) + ((literalPart bitAnd: 16rFF) << 11) + (literalPart bitAnd: 16r80000).
	
	^ literal