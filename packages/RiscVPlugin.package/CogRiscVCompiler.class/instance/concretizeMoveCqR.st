concretize
concretizeMoveCqR

	<inline: true>
	| imm destAddr instrOffset |
	imm := operands at: 0.
	destAddr := operands at: 1.
	instrOffset := self movI: imm toR: destAddr offset: 0.
	
	^ instrOffset * 4