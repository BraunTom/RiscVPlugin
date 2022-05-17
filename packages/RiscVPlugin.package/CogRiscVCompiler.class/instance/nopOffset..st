instructions
nopOffset: offset
	"add 0 to 0 and write to hardwired register. What a cheesy elegant way at the same time"

	^ self addiRd: X0 rs1: X0 imm: 0 offset: offset