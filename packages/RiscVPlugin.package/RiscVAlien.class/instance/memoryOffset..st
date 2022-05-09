Cog API
memoryOffset: anInteger
	"Set the memory offset. This may be non-zero to adapt to the SpurMemoryManager
	  simulators discarding the first work of memory to implement a null pointer trap.
	  Answer the previous value."
	^self primitiveSetMemoryOffset: anInteger