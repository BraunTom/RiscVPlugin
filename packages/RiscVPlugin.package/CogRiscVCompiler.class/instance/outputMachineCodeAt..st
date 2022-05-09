generate machine code
outputMachineCodeAt: targetAddress
	"Override to move machine code a word at a time."
	<inline: true>
	0 to: machineCodeSize - 1 by: 4 do:
		[:j|
		cogit codeLong32At: targetAddress + j put: (self adaptEndianness:(machineCode at: j // 4))]