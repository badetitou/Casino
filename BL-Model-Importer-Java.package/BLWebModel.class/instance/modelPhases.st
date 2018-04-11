private
modelPhases
	cacheModelPhases
		ifNil: [ cacheModelPhases := self sourceModel allClasses
				select: [ :e | (self listOfPhases collect: #realClassName) includes: e mooseName ] ].
	^ cacheModelPhases