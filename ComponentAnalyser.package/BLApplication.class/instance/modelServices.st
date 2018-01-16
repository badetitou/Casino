accessing
modelServices
	^ self model allTypes
		select: [ :e | (e superclassHierarchy contains: [ :a | (a name = 'RemoteService') ])  and: e isInterface  ]