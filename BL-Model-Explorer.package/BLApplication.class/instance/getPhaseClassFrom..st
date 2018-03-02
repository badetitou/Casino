accessing
getPhaseClassFrom: realClassName
	realClassName ifNil: [ ^self ].
	^ (self model allClasses select: [ :e | realClassName = e mooseName ]) at: 1