accessing
getClassFromHeritance: herit
	herit value to isParameterizedType
		ifTrue: [ ^ herit value to parameterizableClass ].
	^ herit value to