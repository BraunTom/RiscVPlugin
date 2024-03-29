as yet unclassified
primitiveSingleStepInMemory: memoryArray "<Bitmap|ByteArray>" minimumAddress: minimumAddress "<Integer>" readOnlyBelow: minimumWritableAddress "<Integer>"
	"Single-step the receiver using the argument as the store.  Origin the argument at 0. i.e. the first byte of the
	 memoryArray is address 0.  Make addresses below minimumAddress illegal.  Convert out-of-range
	 calls, jumps and memory read/writes into ProcessorSimulationTrap signals."
	<primitive: 'primitiveSingleStepInMemoryMinimumAddressReadWrite' module: 'RiscVPlugin' error: ec>
	^ec isPrimitiveError
		ifTrue:
			[self handleExecutionPrimitiveFailureIn: memoryArray
				minimumAddress: minimumAddress
				code: ec errorCode]
		ifFalse:
			[ec == #'inappropriate operation'
				ifTrue: [self handleExecutionPrimitiveFailureIn: memoryArray
							minimumAddress: minimumAddress]
				ifFalse: [self reportPrimitiveFailure]]