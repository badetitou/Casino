accessing
modelAsync
	^ self model allModelClasses
		select: [ :e | (e superclassHierarchy contains: [ :a | '*AsyncCallback*' match: a name ]) ]