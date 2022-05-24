*RiscVPlugin-override
inOldSpaceAllocateSlots: numSlots format: formatField classIndex: classIndex
	"Allocate an object with numSlots space.  If there is room beneath scavengeThreshold
	 allocate in newSpace, otherwise alocate in oldSpace.  If there is not room in newSpace
	 and a scavenge is not already scheduled, schedule a scavenge."
	<inline: true>
	| numBytes |
	"Object headers are 8 bytes in length if the slot size fits in the num slots field (max implies overflow),
	 16 bytes otherwise (num slots in preceding word).
	 Objects always have at least one slot, for the forwarding pointer,
	 and are multiples of 8 bytes in length."
	numSlots >= self numSlotsMask
		ifTrue: [numSlots >> 56 > 0 ifTrue:
				[^nil]. "overflow size must fit in 56-bits"
			 numBytes := self largeObjectBytesForSlots: numSlots]
		ifFalse: [numBytes := self smallObjectBytesForSlots: numSlots].
	
	^self allocateSlotsInOldSpace: numSlots bytes: numBytes format: formatField classIndex: classIndex
	