concretize
concretizeAlignmentNops
	self assert: machineCodeSize \\ 4 = 0.
	0 to: machineCodeSize - 1 by: 4 do:
		[:p | self nopOffset: p].
	^machineCodeSize