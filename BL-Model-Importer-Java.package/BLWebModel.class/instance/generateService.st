as yet unclassified
generateService
	(sourceModel  allTypes
		select:
			[ :e | (e superclassHierarchy contains: [ :a | a name = 'RemoteService' ]) and: e isInterface ])
		do: [ :aServiceClass | self listOfService add: (self createServiceFromClass: aServiceClass) ]