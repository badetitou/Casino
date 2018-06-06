Extension { #name : #FAMIXIndexedFileAnchor }

{ #category : #'*BL-Model-Importer-Java' }
FAMIXIndexedFileAnchor >> findAllOccurrencesOfVariableNamed: aString [
	"the name of the variable. Cannot be surrounded by other 'word character' (else we can grep others variables)"
	^ (self sourceText findAllOccurrencesOfVariableNamed: aString)
		collect: [ :pos | pos + self startPos ]
]
