as yet unclassified
initializeStackFor: aCogit
	"Different cpus need different stack alignment etc, so handle the details here.
	 See e.g. https://github.com/ARM-software/software-standards/blob/master/abi/aapcs64/aapcs64.rst#the-stack"
	aCogit setStackAlignment: 16 expectedSPOffset: 0 expectedFPOffset: 0.
	PostBuildStackDelta := 0