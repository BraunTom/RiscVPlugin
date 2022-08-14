*RiscVPlugin-override
debugOnly: index

	| allTests result |
	allTests := tests.
	tests := { tests at: index }.
	[result := self debug] ensure: [tests := allTests].
	^ result