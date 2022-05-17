*RiscVPlugin-override
handleFailingFailingUnitializedNew: sizeRequested
	"same logic as in handleFailingFailingBasicNew:"
	
	<primitive: 580>
	"space must be low."
	OutOfMemory signal.
	^self unitializedNew: sizeRequested 