as yet unclassified
initializeAbstractRegisters

	TempReg			:= X6.
	ClassReg			:= X18.
	ReceiverResultReg	:= X11.
	SendNumArgsReg	:= X10.
	SPReg				:= X2.
	FPReg				:= X8.
	Arg0Reg			:= X12.
	Arg1Reg			:= X13.
	LinkReg			:= X1. 
	PCReg				:= PC.
	ABIResultReg          := X11.
	
	Extra0Reg			:= X29.
	Extra1Reg			:= X30.
	Extra2Reg			:= X31.
	Extra3Reg			:= X5.
	RISCTempReg		:= X19.

	ABICalleeSavedRegisterMask := self registerMaskFor: 8 and: 9 and: 18 and: 19 and: 20 and: 21 and: 22 and: 23 and: 24 and: 25 and: 26 and: 27.
	ABICallerSavedRegisterMask := self registerMaskFor: 1 and: 5 and: 6 and: 7 and: 10 and: 11 and: 12 and: 13 and: 14 and: 15 and: 16 and: 17 and: 28 and: 30 and: 31.
	self flag: #Todo.
	CallerSavedRegisterMask := ABICallerSavedRegisterMask
								bitAnd: (self registerMaskFor: ClassReg and: ReceiverResultReg and: SendNumArgsReg and: Arg0Reg).