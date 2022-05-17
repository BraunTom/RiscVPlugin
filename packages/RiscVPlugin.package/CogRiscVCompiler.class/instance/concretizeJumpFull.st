concretize
concretizeJumpFull

	| jumpTargetInstruction jumpTargetAddr instrOffset |
	<var: #jumpTargetInstruction type: #'AbstractInstruction *'>
	jumpTargetInstruction := self longJumpTargetAddress.
	jumpTargetAddr := jumpTargetInstruction asUnsignedInteger.
	
	instrOffset := self movI: jumpTargetAddr toR: TempReg offset: 0.
	^ (self jalrWithRd: ZERO rs1: TempReg imm: 0 offset: instrOffset) * 4