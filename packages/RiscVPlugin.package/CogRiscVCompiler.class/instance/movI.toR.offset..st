instructions
movI: immediate toR: register offset: offset
	"R[register] = immediate64"
	
	| instrOffset |
	immediate < 0 ifTrue: [self halt].
	
	instrOffset := offset.
	
	(immediate >= (1 << 32))
		ifTrue: [ | lowerRegisterPart |
			lowerRegisterPart := (immediate >> 32) bitAnd: 16rFFF. "immediate[43:32]"
			instrOffset := self addiRd: register rs1: X0 imm: lowerRegisterPart offset: instrOffset.	  "register[11:0] = immediate[43:32]"
			instrOffset := self luiImm: (immediate >> 44) toRd: register offset: instrOffset.   "register[31:12] = immediate[63:44] "
			instrOffset := self slliFrom: register to: register by: 32 offset: instrOffset].  "register[63:32] = register[31:0]"
	
	instrOffset := self addiRd: register rs1: X0 imm: (immediate bitAnd: 16rFFF) offset: instrOffset. "register[11:0] = immediate[11:0]"
	
	immediate >= (1 << 12)
		ifTrue: [
			"register[31:12] = immediate[31:12] "
			instrOffset := self 
				luiImm: ((immediate >> 12) bitAnd: 16rFFFFF)
				toRd: register
				offset: instrOffset].
		
	^ instrOffset

	