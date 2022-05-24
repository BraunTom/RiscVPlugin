inline cacheing
jumpLongConditionalTargetBeforeFollowingAddress: mcpc
	"Extract the target from a long conditional jump.  On many ISAs this si the same as
	 extracting the target from a long unconditional jump, so we provide the default here.
	 Processors such as MIPS override as appropriate."
	<inline: true>
	
	"
	-16 to: 0
		do: [:ea| Transcript showln: (cogit processor disassembleInstructionAt: mcpc + (ea * 4) In: objectMemory memory)]
	"
	| instr |
	"nop"
	instr := self adaptEndianness: (objectMemory long32At: mcpc - 4).
	
	self assert: instr = self nop.
	
	"jal"
	"instr := self adaptEndianness: (objectMemory long32At: mcpc - 8).
	literalPart := instr >> 12.
	
	literal := ((literalPart >> 9) bitAnd: 16r3FF) + (((literalPart >> 8) bitAnd: 1) << 10) + ((literalPart bitAnd: 16rFF) << 11) + (literalPart bitAnd: 16r80000) * 2."
		
	"self assert: (instr bitAnd: 2r1111111) = self branchOpcode.
	literal := ((instr >> 8) bitAnd: 2r1111) + ((instr >> 21) bitAnd: 2r1111110000) + (((instr >> 7) bitAnd: 2r1) << 10) + (((instr >> 31) bitAnd: 2r1) << 11)."
	
	"fake it till you make it"
	^ (self literalAtAdress: mcpc - 12)"literal + mcpc - 12"