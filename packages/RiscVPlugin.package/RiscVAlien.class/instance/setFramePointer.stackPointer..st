as yet unclassified
setFramePointer: framePointer stackPointer: stackPointer
	"Initialize the processor's frame and stack pointers; https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf Table 18.2: RISC-V calling convention register usage."
	self x8: framePointer.
	self x2: stackPointer