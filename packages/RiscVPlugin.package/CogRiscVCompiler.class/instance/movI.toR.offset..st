instructions
movI: immediate toR: register offset: offset
	"R[register] = immediate64"
	
	| bits |
	"Hack: For negative integers, we only care about the full 64-Bit Bit pattern.
	Bit-Anding with 64-Bit will turn a negative value into a LargePositiveInteger with the correct two-complement bit pattern."
	bits := immediate bitAnd: 16rFFFFFFFFFFFFFFFF.
	
	bits < (1 << 12) ifTrue: [^ self movI12: bits toR: register offset: offset].
	bits < (1 << 32) ifTrue: [^ self movI32: bits toR: register offset: offset].
	
	^ self movI64: bits toR: register offset: offset


	