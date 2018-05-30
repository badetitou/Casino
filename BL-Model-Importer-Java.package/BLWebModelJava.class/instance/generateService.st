as yet unclassified
generateService
	| interfaceService |
	interfaceService := self sourceModel allTypes
		select:
			[ :e | (e superclassHierarchy contains: [ :a | a name = 'RemoteService' ]) and: e isInterface ].
	interfaceService
		addAll:
			((interfaceService flatCollect: [ :class | class classes flatCollect: #attributes ])
				collect: #declaredType).
	interfaceService
		do: [ :aServiceClass | self listOfService add: (self createServiceFromClass: aServiceClass) ]