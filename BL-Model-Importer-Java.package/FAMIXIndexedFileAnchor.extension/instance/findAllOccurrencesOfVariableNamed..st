*BL-Model-Importer-Java
findAllOccurrencesOfVariableNamed: aString
	"the name of the variable. Cannot be surrounded by other 'word character' (else we can grep others variables)"
	^ (self sourceText findAllOccurrencesOfVariableNamed: aString)
		collect: [ :pos | pos + self startPos ]