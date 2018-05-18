as yet unclassified
computeTSClassNameFromFAMIXCLass: aFAMIXClass
	| hostClass |
	hostClass := aFAMIXClass notAnonymousContainer.
	^ hostClass name , '$', ((((hostClass clientTypes select: [ :client | client notAnonymousContainer = hostClass ]) asOrderedCollection sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ] ) indexOf: aFAMIXClass ifAbsent: [self error: 'I don''t know currently']) - 1) asString.