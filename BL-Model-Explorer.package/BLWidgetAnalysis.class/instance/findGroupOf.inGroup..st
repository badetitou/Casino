private
findGroupOf: aClass inGroup: aCollectionOfBlWidgetGroup
	^ (aCollectionOfBlWidgetGroup select: [ :a | a includes: aClass ]) asOrderedCollection
		at: 1
		ifAbsent: [ ^ aClass ]