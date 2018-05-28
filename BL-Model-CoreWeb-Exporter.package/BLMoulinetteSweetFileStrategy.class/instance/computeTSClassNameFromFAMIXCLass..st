as yet unclassified
computeTSClassNameFromFAMIXCLass: aFAMIXClass
	| hostMethod hostClass notAnonymousHostClass hostName |
	hostName := ''.
	hostMethod := aFAMIXClass notAnonymousContainer.
	notAnonymousHostClass := aFAMIXClass notAnonymousClassContainer.
	hostClass := (hostMethod atScope: FAMIXClass) at: 1.
	hostClass isAnonymousClass
		ifTrue: [ hostName := self computeTSClassNameFromFAMIXCLass: hostClass ]
		ifFalse: [ hostName := hostClass name ].
	^ hostName , '$'
		,
			((((hostMethod types select: [ :client | client notAnonymousClassContainer = notAnonymousHostClass ]) asOrderedCollection
				sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) indexOf: aFAMIXClass ifAbsent: [ self error: 'I don''t know currently' ]) - 1) asString