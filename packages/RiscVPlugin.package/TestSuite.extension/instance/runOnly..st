*RiscVPlugin-override
runOnly: index

	| allTests result |
	allTests := tests.
	tests := { tests at: index }.
	[result := self run] ensure: [tests := allTests].
	^ result