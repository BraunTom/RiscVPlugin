*RiscVPlugin-override
unitializedNew: requestedSize

	<primitive: 580 error: ec>
	(ec == #'insufficient object memory') ifTrue:
		[^self handleFailingUnitializedNew: requestedSize].
	(ec == #'bad argument') ifTrue:
		[self error: self printString, ' called #basicNew: with invalid argument ', requestedSize].
	self isVariable ifFalse:
		[self error: self printString, ' cannot have variable sized instances'].
	self primitiveFailed