private
modelPhases
	cacheModelPhases
		ifNil: [ cacheModelPhases := self model allClasses
				select: [ :e | (self listOfPhases collect: #realClassName) includes: e mooseName ] ].
	^ cacheModelPhases