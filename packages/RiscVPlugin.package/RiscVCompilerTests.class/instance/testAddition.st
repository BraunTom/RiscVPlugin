tests
testAddition

	| memory |
	#(0 1 2047 -2048 -10 10) do:
	[:n |
		self concreteCompilerClass dataRegistersWithAccessorsDo: [ :r :rgetter :rsetter |
				| move add |
				self resetGen.
				move := self gen: MoveCwR operand: n operand: r.
				add := self gen: AddCqR operand: 42 operand: r.
				memory := self generateInstructions.
				
				self processor
					reset.
				"self halt."
				[processor pc < memory size] whileTrue: [
					self processor singleStepIn: memory].
				
				self concreteCompilerClass dataRegistersWithAccessorsDo: [:ireg :getter :setter | |expected|
					expected := getter == rgetter ifTrue: [n + 42] ifFalse: [0].
					expected := expected bitAnd: 16rFFFFFFFFFFFFFFFF.
					self assert: (self processor perform: getter) = expected].
				self assert: self processor pc == 24.
			]
	]