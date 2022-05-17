*RiscVPlugin-override
handleFailingUnitializedNew: sizeRequested 
	"same logic as handleFailingBasicNew: but we need to adapt for the unitilized logic"

	<primitive: 580>
	| bytesRequested |
	bytesRequested := self byteSizeOfInstanceOfSize: sizeRequested.
	Smalltalk garbageCollect < bytesRequested ifTrue:
		[Smalltalk growMemoryByAtLeast: bytesRequested].
	"retry after global garbage collect and possible grow"
	^self handleFailingFailingUnitializedNew: sizeRequested