initialization
getPhaseFromClass: aClass
	^ (self listOfPhases select: [ :a | a realClassName = aClass mooseName ]) ifEmpty: [ ^nil ] ifNotEmpty: [:a | a at: 1]. 
	