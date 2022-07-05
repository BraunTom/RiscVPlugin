tests
testMoveCwR

	| memory |
	#(0 1 16rFF00FF 16rDEADBEEF01234567 -1 -123456789) do:
	[:n |
		self concreteCompilerClass dataRegistersWithAccessorsDo: [ :r :rgetter :rsetter |
				| move |
				self resetGen.
				move := self gen: MoveCwR operand: n operand: r.
				memory := self generateInstructions.
				
				self processor
					reset.
				[processor pc < memory size] whileTrue: [
					self processor singleStepIn: memory].
				
				self concreteCompilerClass dataRegistersWithAccessorsDo: [:ireg :getter :setter | |expected|
					expected := getter == rgetter ifTrue: [n] ifFalse: [0].
					expected := expected bitAnd: 16rFFFFFFFFFFFFFFFF. "Convert to binary form."
					self assert: (self processor perform: getter) = expected].
				self assert: self processor pc == 20.
			]
	]