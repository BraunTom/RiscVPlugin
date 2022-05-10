abi
genRemoveNArgsFromStack: n
	"This is a no-op on Riscv since the ABI passes up to 4 args in registers and trampolines currently observe that limit."
	<inline: true>
	self flag: #todo. "check"
	self assert: n <= 4.
	^0