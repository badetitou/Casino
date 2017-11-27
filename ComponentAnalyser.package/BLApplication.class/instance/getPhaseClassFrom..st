accessing
getPhaseClassFrom: realClassName
	^ (self model allClasses select: [ :e | realClassName = e mooseName ]) at: 1