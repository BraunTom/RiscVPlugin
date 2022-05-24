as yet unclassified
rewriteConditionalJumpLongAt: callSiteReturnAddress target: callTargetAddress
	"Rewrite a conditional jump long to jump to target.  This version defaults to using
	 rewriteJumpLongAt:, which works for many ISAs.  Subclasses override if necessary."
	"jumpLong:
		bne
		-16 li
		-12 lui
		-8   jalr
		-4   nop"
	
	"
	-16 to: 0
		do: [:ea| Transcript showln: (cogit processor disassembleInstructionAt: callSiteReturnAddress + (ea * 4) In: objectMemory memory)]
	"
	| instr newInstruction |
	self assert: (self instructionAt: callSiteReturnAddress - 4) = self nop.
	
	"lui"
	instr := self instructionAt: callSiteReturnAddress - 12.
	
	newInstruction := (instr bitAnd: 16rFFF) + (callTargetAddress bitAnd: 16rFFFFF000).
	objectMemory long32At: callSiteReturnAddress - 12 put: (self adaptEndianness: newInstruction).
	
	"addI"
	instr := self instructionAt: callSiteReturnAddress - 16.
	
	newInstruction := (instr bitAnd: 16r000FFFFF) + ((callTargetAddress bitAnd: 16rFFF) << 20).
	objectMemory long32At: callSiteReturnAddress - 16 put: (self adaptEndianness: newInstruction)