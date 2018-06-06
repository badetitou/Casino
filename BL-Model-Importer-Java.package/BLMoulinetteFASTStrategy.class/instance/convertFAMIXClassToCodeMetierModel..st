as yet unclassified
convertFAMIXClassToCodeMetierModel: aFAMIXClass
	^ aFAMIXClass methods
		collect: [ :aFamixMethod |  self fastImporter parseTreeForSource: aFamixMethod  sourceText ].