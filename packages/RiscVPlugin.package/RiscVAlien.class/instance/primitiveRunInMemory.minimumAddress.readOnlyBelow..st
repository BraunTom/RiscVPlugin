as yet unclassified
primitiveRunInMemory: memoryArray "<Bitmap|ByteArray>" minimumAddress: minimumAddress "<Integer>" readOnlyBelow: minimumWritableAddress "<Integer>"
	
	self halt.
	^ self actualPrimitiveRunInMemory: memoryArray minimumAddress: minimumAddress readOnlyBelow: minimumWritableAddress.