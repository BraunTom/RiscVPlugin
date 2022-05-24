instructions
nopOffset: offset
	"add 0 to 0 and write to hardwired register. What a cheesy elegant way at the same time"
	
	machineCode	
		at: offset
		put: self nop.
		
	^ offset + 1