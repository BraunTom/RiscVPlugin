instructions
movI: immediate toR: register offset: offset
	"R[register] = immediate64"
	
	| instrOffset bits |
	"Hack: For negative integers, we only care about the full 64-Bit Bit pattern.
	Bit-Anding with 64-Bit will turn a negative value into a LargePositiveInteger with the correct two-complement bit pattern."
	bits := immediate bitAnd: 16rFFFFFFFFFFFFFFFF.
	
	instrOffset := offset.
	
	(bits >= (1 << 32))
		ifTrue: [ | lowerRegisterPart |
			lowerRegisterPart := (bits >> 32) bitAnd: 16rFFF. "bits[43:32]"
			instrOffset := self addiRd: register rs1: X0 imm: lowerRegisterPart offset: instrOffset.	  "register[11:0] = bits[43:32]"
			instrOffset := self luiImm: (bits >> 44) toRd: register offset: instrOffset.   "register[31:12] = bits[63:44] "
			instrOffset := self slliFrom: register to: register by: 32 offset: instrOffset].  "register[63:32] = register[31:0]"
	
	instrOffset := self addiRd: register rs1: X0 imm: (bits bitAnd: 16rFFF) offset: instrOffset. "register[11:0] = bits[11:0]"
	
	bits >= (1 << 12)
		ifTrue: [
			"register[31:12] = bits[31:12] "
			instrOffset := self 
				luiImm: ((bits >> 12) bitAnd: 16rFFFFF)
				toRd: register
				offset: instrOffset].
		
	^ instrOffset

	