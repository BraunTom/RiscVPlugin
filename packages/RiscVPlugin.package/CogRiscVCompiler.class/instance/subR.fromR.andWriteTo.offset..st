instructions
subR: register1 fromR: register2 andWriteTo: destination offset: offset
	
	"sub"
	machineCode
		at: offset
		put: (self rTypeFunct: 2r0100000 rs2: register2 rs1: register1 funct: 2r000 rd: destination opcode: 2r0110011).
		
	^ offset + 1