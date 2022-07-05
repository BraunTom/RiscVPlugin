instructions
subR: register1 fromR: register2 andWriteTo: destination offset: offset
	
	"sub"
	machineCode
		at: offset
		put: (self rTypeFunct: 2r0100000 rs2: register1 rs1: register2 funct: 2r000 rd: destination opcode: 2r0110011).
		"Note that register1 is fed into rs2 here! Therefore register1 is subtracted from register2!
		destination := register2 - register1."
		
	^ offset + 1