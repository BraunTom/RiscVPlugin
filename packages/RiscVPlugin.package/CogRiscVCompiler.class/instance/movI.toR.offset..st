instructions
movI: immediate toR: register offset: initialOffset
	"R[register] = immediate64"
	
	| highbits lowbits bits offset|
	offset := initialOffset.
	"Hack: For negative integers, we only care about the full 64-Bit Bit pattern.
	Bit-Anding with 64-Bit will turn a negative value into a LargePositiveInteger with the correct two-complement bit pattern."
	bits := immediate bitAnd: 16rFFFFFFFFFFFFFFFF.

	"Loading large immediates in Risc-V is pretty challenging. Small immediates can simply be done by either:
	ADDI, or LUI+ADDI, but we want to support full 64-Bit values.
	As both ADDI, as well as LUI do signed arithmetic, this makes it basically impossible to load a 64-Bit value in two parts without using two registers.
	Therefore we simply emit our immediate as part of the instruction stream and load it using the pc.
	This can simply be achieved by jumping over the 'fake' instructions and then loading them as literal data."
	offset := self jalBy: 6 store: register offset: offset.
	
	highbits := (bits bitAnd: 16rFFFFFFFF00000000) >> 32.
	highbits := (highbits bitAnd: 16r0000FFFF) << 16 bitOr: (highbits bitAnd: 16rFFFF0000) >> 16.
	machineCode at: offset put: highbits.
	offset := offset + 1.
	
	lowbits := bits bitAnd: 16r00000000FFFFFFFF.
	lowbits := (lowbits bitAnd: 16r0000FFFF) << 16 bitOr: (lowbits bitAnd: 16rFFFF0000) >> 16.
	machineCode at: offset put: lowbits.
	offset := offset + 1.  
	
	offset := self ldOff: 0 fromRs: register to: register offset: offset.
	
	^ offset	