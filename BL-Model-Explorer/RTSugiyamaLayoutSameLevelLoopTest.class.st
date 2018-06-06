"
A RTSugiyamaLayoutSameLevelLoopTest is a test class for testing the behavior of RTSugiyamaLayoutSameLevelLoop
"
Class {
	#name : #RTSugiyamaLayoutSameLevelLoopTest,
	#superclass : #TestCase,
	#category : 'BL-Model-Explorer-Tests'
}

{ #category : #'tests-private' }
RTSugiyamaLayoutSameLevelLoopTest >> testIsInSameCycleGroupOfFromCycles [
	| el1 el2 cycles |
	el1 := 1.
	el2 := 2.
	cycles := {{el1.el2}.
	{}}.
	self assert: (RTSugiyamaLayoutSameLevelLoop new is: el1 inSameCycleGroupOf: el2 fromCycles: cycles)
]
