*RiscVPlugin-override
inOldSpaceInstantiatePinnedClass: classObj
	| instSpec classFormat numSlots classIndex newObj |
	classFormat := self formatOfClass: classObj.
	instSpec := self instSpecOfClassFormat: classFormat.
	(self isFixedSizePointerFormat: instSpec) ifFalse:
		[^nil].
	classIndex := self ensureBehaviorHash: classObj.
	classIndex < 0 ifTrue:
		[coInterpreter primitiveFailFor: classIndex negated.
		 ^nil].
	numSlots := self fixedFieldsOfClassFormat: classFormat.
	newObj := self inOldSpaceAllocateSlots: numSlots format: instSpec classIndex: classIndex.
	newObj ifNotNil:
		[self fillObj: newObj numSlots: numSlots with: nilObj.
		self setIsPinnedOf: newObj to: true].
	^newObj