as yet unclassified
fullCallsAreRelative
	"Answer if CallFull and/or JumpFull are relative and hence need relocating on method
	 compation. If so, they are annotated with IsRelativeCall in methods and relocated in
	 relocateIfCallOrMethodReference:mcpc:delta:"
	self flag: #Todo. "just a guess to be honest"
	^false