as yet unclassified
convertFAMIXClassToTypescriptString: aFAMIXClass
	^ aFAMIXClass methods do: [:aFamixMethod | "aFamixMethod generateFAST" ]"collect: [ :method | self fastImporter parseTreeForSource: method sourceText ]"