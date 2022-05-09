instructions
addR: register1 toR: register2 andWriteTo: destination offset: offset
	
	"sub"
	machineCode
		at: offset
		put: (self rTypeFunct: 2r0000000 rs2: register2 rs1: register1 funct: 2r000 rd: destination opcode: 2r0110011).
		
	^ offset + 1