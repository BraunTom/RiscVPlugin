as yet unclassified
printRegisterState: registerStateVector on: aStream

	"((0 to: 31) collect: [:ea | 'x' , ea asString]) joinSeparatedBy: ' ' "
	"
	'x0   x1   x2   x3   x4   x5  x6   x7   cr
			x8   x9   x10 x11 x12 x13 x14 x15 cr
			x16 x17 x18 x19 x20 x21 x22 x23 cr
			x24 x25 x26 x27 x28 x29 x30 x31 cr' copyReplaceAll: 'x' with: 'f'
	"
	self printFields: #(
			x0   x1   x2   x3   x4   x5  x6   x7   cr
			x8   x9   x10 x11 x12 x13 x14 x15 cr
			x16 x17 x18 x19 x20 x21 x22 x23 cr
			x24 x25 x26 x27 x28 x29 x30 x31 cr
			f0   f1   f2   f3   f4   f5  f6   f7   cr
			f8   f9   f10 f11 f12 f13 f14 f15 cr
			f16 f17 f18 f19 f20 f21 f22 f23 cr
			f24 f25 f26 f27 f28 f29 f30 f31 cr
			pc cr
		) inRegisterState: registerStateVector on: aStream