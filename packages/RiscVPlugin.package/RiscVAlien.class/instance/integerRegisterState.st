as yet unclassified
integerRegisterState
	"Answer a WordArray of the integer registers, the pc and the flags.
	 This primitive is unnecessary; it exists only to speed up single-stepping.
	 If the primitive fails fall back and yield an Array of the same."
	<primitive: 'primitiveIntegerRegisterState' module: 'RiscVPlugin'>
	^{	self x0 . self x1 . self x2 . self x3 . self x4 . self x5 . self x6 . self x7 . self x8 . 
		self x9 . self x10 . self x11 . self x12 . self x13 . self x14 . self x15 . self x16 . 
		self x17 . self x18 . self x19 . self x20 . self x21 . self x22 . self x23 . self x24 . 
		self x25 . self x26 . self x27 . self x28 . self x29 . self x30 . self x31}