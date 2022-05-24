instructions
luiImm: immediate toRd: rd offset: offset
	"R[rd] = SignExt(immediate20 << 12)"

	machineCode
		at: offset
		put: (self uTypeImm: immediate rd: rd opcode: self luiOpcode).
		
	^ offset + 1