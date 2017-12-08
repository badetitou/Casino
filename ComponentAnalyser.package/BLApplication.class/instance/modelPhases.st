accessing
modelPhases
	cacheModelPhases ifNil: [ cacheModelPhases :=  self model allClasses select: [ :e | (self phases collect: #realClassName) includes: e mooseName ]].
	^ cacheModelPhases