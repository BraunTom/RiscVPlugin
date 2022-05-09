instructions
storeWordFromR2: rs2 rs1: rs1 imm: imm offset: offset

	"SD; Mem[R[rs1] + SignExt(imm)] = R[rs2]"
	| instruction |

	instruction := self 
		sTypeImm: (imm >> 4) 
		rs2: rs2 
		rs1: rs1 
		funct: 2r010 
		imm: (imm bitAnd: 2r1111) 
		opcode: 2r0100011.
		
	machineCode
		at: offset
		put: instruction.
		
	^ offset + 1