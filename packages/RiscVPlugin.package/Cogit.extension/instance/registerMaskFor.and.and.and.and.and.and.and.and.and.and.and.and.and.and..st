*RiscVPlugin-override
registerMaskFor: reg1 and: reg2 and: reg3 and: reg4 and: reg5 and: reg6 and: reg7 and: reg8 and: reg9 and: reg10  and: reg11 and: reg12 and: reg13  and: reg14 and: reg15
	<inline: true>
	^(((((((((((((1 << reg1 bitOr: 1 << reg2) bitOr: 1 << reg3) bitOr: 1 << reg4) bitOr: 1 << reg5) bitOr: 1 << reg6) bitOr: 1 << reg7) bitOr: 1 << reg8) bitOr: 1 << reg9) bitOr: 1 << reg10) bitOr: 1 << reg11) bitOr: 1 << reg12) bitOr: 1 << reg13) bitOr: 1 << reg14) bitOr: 1 << reg15