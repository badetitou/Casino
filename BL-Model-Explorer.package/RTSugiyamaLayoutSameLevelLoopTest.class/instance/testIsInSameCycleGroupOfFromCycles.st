tests-private
testIsInSameCycleGroupOfFromCycles
	| el1 el2 cycles |
	el1 := 1.
	el2 := 2.
	cycles := {{el1.el2}.
	{}}.
	self assert: (RTSugiyamaLayoutSameLevelLoop new is: el1 inSameCycleGroupOf: el2 fromCycles: cycles)