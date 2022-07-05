test support
machineCode
	"Currently this function is only used by the AbstractInstructionTests to access the generated machineCode.
	This causes problems for us as we have to do the endianness conversion before running any code in the simulator."
	<doNotGenerate>
	^ super machineCode object collect: [:word | self adaptEndianness: word].
	