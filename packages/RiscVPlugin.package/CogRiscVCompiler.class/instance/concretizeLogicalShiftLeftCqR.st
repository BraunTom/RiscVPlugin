concretize
concretizeLogicalShiftLeftCqR
	<inline: true>
	| reg constant |
	constant := operands at: 0.
	reg := operands at: 1.
	
	^ (self slliFrom: reg to: reg by: constant offset: 0) * 4