as yet unclassified
storeLiteral32: literal32 beforeFollowingAddress: followingAddress
	"Answer the constant loaded by the instruction sequence just before this address:"
	"error hier; nicht nach hacky value suchen"
	
	^ self atAddress: followingAddress - 4 putLiteral: literal32