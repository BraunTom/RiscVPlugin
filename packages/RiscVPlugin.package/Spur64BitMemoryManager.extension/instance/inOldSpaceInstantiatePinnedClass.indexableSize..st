*RiscVPlugin-override
inOldSpaceInstantiatePinnedClass: classObj indexableSize: nElements
	<api>
	<var: #nElements type: #usqInt>
	"Allocate an instance of a variable class, excepting CompiledMethod."
	| instSpec classFormat numSlots classIndex newObj fillValue |
	classFormat := self formatOfClass: classObj.
	instSpec := self instSpecOfClassFormat: classFormat.
	classIndex := self rawHashBitsOf: classObj.
	fillValue := 0.
	instSpec caseOf: {
		[self arrayFormat]	->
			[numSlots := nElements.
			 fillValue := nilObj].
		[self indexablePointersFormat]	->
			[numSlots := (self fixedFieldsOfClassFormat: classFormat) + nElements.
			 fillValue := nilObj].
		[self weakArrayFormat]	->
			[numSlots := (self fixedFieldsOfClassFormat: classFormat) + nElements.
			 fillValue := nilObj].
		[self sixtyFourBitIndexableFormat]	->
			[numSlots := nElements].
		[self firstLongFormat]	->
			[(classIndex = ClassFloatCompactIndex and: [nElements ~= 2]) ifTrue:
				[coInterpreter primitiveFailFor: PrimErrBadReceiver.
				 ^nil].
			 numSlots := nElements + 1 // 2.
			 instSpec := instSpec + (nElements bitAnd: 1)].
		[self firstShortFormat]	->
			[numSlots := nElements + 3 // 4.
			 instSpec := instSpec + (4 - nElements bitAnd: 3)].
		[self firstByteFormat]	->
			[numSlots := nElements + 7 // 8.
			 instSpec := instSpec + (8 - nElements bitAnd: 7)] }
		otherwise: "non-indexable"
			["Some Squeak images include funky fixed subclasses of abstract variable
			  superclasses. e.g. DirectoryEntry as a subclass of ArrayedCollection.
			  The (Threaded)FFIPlugin expects to be able to instantiate ExternalData via
			  this method.
			  Hence allow fixed classes to be instantiated here iff nElements = 0."
			 (nElements ~= 0 or: [instSpec > self lastPointerFormat]) ifTrue:
				[^nil].
			 numSlots := self fixedFieldsOfClassFormat: classFormat.
			 fillValue := nilObj].
	classIndex = 0 ifTrue:
		[classIndex := self ensureBehaviorHash: classObj.
		 classIndex < 0 ifTrue:
			[coInterpreter primitiveFailFor: classIndex negated.
			 ^nil]].
	numSlots > self maxSlotsForAlloc ifTrue:
			[coInterpreter primitiveFailFor: PrimErrUnsupported.
			 ^nil].
	newObj := self allocateSlotsInOldSpace: numSlots format: instSpec classIndex: classIndex.
	newObj ifNotNil:
		[self fillObj: newObj numSlots: numSlots with: fillValue.
		self setIsPinnedOf: newObj to: true].
	^newObj