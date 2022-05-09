as yet unclassified
genSaveRegs: regMask
	"Save the registers in regMask for a call into the C run-time from a trampoline"

	self flag: #Todo. "see the other implementors for secruity checks I currently do not know enough about"
	"go backwards so we can pop them later on in the correct order"
	X31 to: X0 by: -1 do:
		[:reg|
		 (regMask anyMask: (cogit registerMaskFor: reg)) ifTrue:
			[cogit PushR: reg]].
	^0