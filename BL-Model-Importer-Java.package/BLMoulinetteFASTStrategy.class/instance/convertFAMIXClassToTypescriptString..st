as yet unclassified
convertFAMIXClassToTypescriptString: aFAMIXClass
	^ (aFAMIXClass methods collect: [ :method | (self fastImporter parseTreeForSource: method sourceText) ]).