instructions
jalrWithRd: rd rs1: rs1 imm: imm offset: offset
	"The indirect jump instruction JALR (jump and link register) uses the I-type encoding. The target
	address is obtained by adding the 12-bit signed I-immediate to the register rs1, then setting the
	least-significant bit of the result to zero. The address of the instruction following the jump (pc+4)
	is written to register rd. Register x0 can be used as the destination if the result is not required."
	
	<inline: true>
	
	machineCode 
		at: offset
		put: (self iTypeImm: imm rs1: rs1 funct3: 2r000 rd: rd opcode: 2r1100111).
		
	^ offset + 1