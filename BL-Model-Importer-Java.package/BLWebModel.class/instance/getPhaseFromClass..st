as yet unclassified
getPhaseFromClass: aClass
	^ (self listOfPhases select: [ :a | a source = aClass ]) ifEmpty: [ ^nil ] ifNotEmpty: [:a | a at: 1]. 
	