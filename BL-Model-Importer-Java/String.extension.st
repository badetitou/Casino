Extension { #name : #String }

{ #category : #'*BL-Model-Importer-Java' }
String >> extractParameters [
	^ ((self
		copyFrom: (self findString: '(') + 1
		to: (self findLastOccurrenceOfString: ')' startingAt: 0) - 1)
		findTokens: ','
		escapedBy: '"') collect: [ :string | string trim ]
]

{ #category : #'*BL-Model-Importer-Java' }
String >> findAllOccurrencesOfVariableNamed: substring [ 
	^ (('([^\w]?)',substring,'[^\w]') asRegex matchingRangesIn: self) collect: [:a | a first ].
]
