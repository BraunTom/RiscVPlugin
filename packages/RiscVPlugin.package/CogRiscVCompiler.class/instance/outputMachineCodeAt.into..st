generate machine code
outputMachineCodeAt: targetAddress into: aByteArray
	"Override to move machine code a word at a time."
	<doNotGenerate>
	0 to: machineCodeSize - 1 by: 4 do:
		[:j| | bytes |
		bytes := self adaptEndianness: (machineCode at: j // 4).
		aByteArray uint32At: targetAddress + j + 1 put: bytes]