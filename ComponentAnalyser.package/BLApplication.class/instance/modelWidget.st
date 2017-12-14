accessing
modelWidget
	^ self model allModelClasses
		select: [ :e | e superclassHierarchy contains: [ :a | a name = 'Widget' ] ]