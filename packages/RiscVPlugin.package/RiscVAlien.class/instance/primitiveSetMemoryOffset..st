as yet unclassified
primitiveSetMemoryOffset: memoryOffset
	"Set the memory offset. This may be non-zero to adapt to the SpurMemoryManager
	 simulators discarding the first work of memory to implement a null pointer trap.
	 Answer the previous value."
	<primitive: 'primitiveMemoryOffset' module: 'RiscVPlugin' error: ec>
	^self reportPrimitiveFailure