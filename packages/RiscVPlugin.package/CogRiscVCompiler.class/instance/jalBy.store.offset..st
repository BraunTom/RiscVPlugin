instructions
jalBy: imm store: rd offset: offset
		
	machineCode
		at: offset
		put: (self jalBy: imm store: rd).
		
	^ offset + 1