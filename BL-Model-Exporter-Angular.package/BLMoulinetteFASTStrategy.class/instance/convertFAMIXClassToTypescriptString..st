as yet unclassified
convertFAMIXClassToTypescriptString: aFAMIXClass
	^ '',  (aFAMIXClass methods flatCollect: [ :method | (self fastImporter parseTreeForSource: method sourceText) angularString  ]).