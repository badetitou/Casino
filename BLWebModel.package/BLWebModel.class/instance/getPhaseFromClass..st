initialization
getPhaseFromClass: aClass
	^ (self listOfPhases select: [ :a | a realClassName = aClass mooseName ]) ifEmpty: [ ^nil ]. 
	