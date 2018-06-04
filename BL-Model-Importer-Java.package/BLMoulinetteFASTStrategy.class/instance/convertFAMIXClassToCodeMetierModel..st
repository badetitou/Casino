as yet unclassified
convertFAMIXClassToCodeMetierModel: aFAMIXClass
	^ aFAMIXClass methods do: [:aFamixMethod | "aFamixMethod generateFAST" ]"collect: [ :method | self fastImporter parseTreeForSource: method sourceText ]"