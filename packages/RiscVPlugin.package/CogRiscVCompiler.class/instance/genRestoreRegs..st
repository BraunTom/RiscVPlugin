abi
genRestoreRegs: regMask
	"Restore the registers in regMask as saved by genSaveRegs:.
	 We don't need to do anything because all of the abstract registers are
	 allocated to C preserved registers.  But for the future..."

	X0 to: X31 do:
		[:reg|
		 (regMask anyMask: (cogit registerMaskFor: reg)) ifTrue:
			[cogit PopR: reg]].
	^0