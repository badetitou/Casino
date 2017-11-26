accessing
modelPhases
	^ self model allClasses select: [ :e | (self phases collect: #realClassName) includes: e mooseName ]