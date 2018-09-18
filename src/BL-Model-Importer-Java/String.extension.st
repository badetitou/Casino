Extension { #name : #String }

{ #category : #'*BL-Model-Importer-Java' }
String >> extractParameters [
	^ ((self
		copyFrom: (self findString: '(') + 1
		to: (self findLastOccurrenceOfString: ')' startingAt: 1) - 1)
		findTokens: ',')  collect: [ :string | ((string trim withoutPrefix: '"') withoutSuffix: '"' ) withoutPrefix: '"' ]
]

{ #category : #'*BL-Model-Importer-Java' }
String >> findAllOccurrencesOfVariableNamed: substring [ 
	^ (('([^\w]?)',substring,'[^\w]') asRegex matchingRangesIn: self) collect: [:a | a first ].
]
