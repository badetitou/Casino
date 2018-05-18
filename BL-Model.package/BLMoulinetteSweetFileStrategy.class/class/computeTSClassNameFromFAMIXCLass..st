as yet unclassified
computeTSClassNameFromFAMIXCLass: aFAMIXClass
	| hostMethod hostClass |
	hostMethod := aFAMIXClass notAnonymousContainer.
	hostClass := (hostMethod atScope: FAMIXClass) at: 1.
	^ hostClass name , '$', ((((hostMethod types select: [ :client | client notAnonymousClassContainer = hostClass ]) asOrderedCollection sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ] ) indexOf: aFAMIXClass ifAbsent: [self error: 'I don''t know currently']) - 1) asString.