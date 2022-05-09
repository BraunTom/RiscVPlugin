instructions
lhOff: registerOffset fromRs: source to: destination offset: offset
	
	"The LH instruction loads a 16-bit value from memory into rd. The effective byte address is obtained by adding register
rs1 to the sign-extended 12-bit offset. Loads copy a value from memory to register rd. "
	
	machineCode
		at: offset
		put: (self iTypeImm: registerOffset rs1: source funct3: 2r001 rd: destination opcode: 2r0000011).
		
	^ offset + 1