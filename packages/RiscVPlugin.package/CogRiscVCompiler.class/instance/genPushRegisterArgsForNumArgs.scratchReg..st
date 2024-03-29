smalltalk calling convention
genPushRegisterArgsForNumArgs: numArgs scratchReg: scratchReg
	"Ensure that the register args are pushed before the retpc for arity <= self numRegArgs.
	 This isn't as clumsy on a RISC.  But putting the receiver and
	 args above the return address means the CoInterpreter has a
	 single machine-code frame format which saves us a lot of work."

	"Iff there are register args convert
		sp		->	retpc		(send site retpc)
	 to
		base	->	receiver
					(arg0)
					(arg1)
		sp		->	retpc		(send site retpc)"
	numArgs <= cogit numRegArgs ifTrue:
		[self assert: cogit numRegArgs <= 2.
		 cogit PushR: ReceiverResultReg.
		numArgs > 0 ifTrue:
			[cogit PushR: Arg0Reg.
			 numArgs > 1 ifTrue:
				[cogit PushR: Arg1Reg]]]