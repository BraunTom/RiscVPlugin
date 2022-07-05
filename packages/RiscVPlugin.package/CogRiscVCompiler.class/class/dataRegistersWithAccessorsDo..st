test support
dataRegistersWithAccessorsDo: aBlock

	"(1 to: 31) collect: [:i| ('x', i) asSymbol]."
	| accessors |
	accessors := #(
		#x1 #sp #x3 #x4
		#x5 #x6 #x7 #x8
		#x9 #x10 #x11 #x12
		#x13 #x14 #x15 #x16
		#x17 #x18 #x19 #x20
		#x21 #x22 #x23 #x24
		#x25 #x26 #x27 #x28
		#x29 #x30 #x31).
	
	(1 to: 31) withIndexDo: [:reg :index |
		aBlock 
			value: reg
			value: (accessors at: index) 
			value: ((accessors at: index), ':') asSymbol
	]