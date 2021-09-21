Extension { #name : #FamixTSourceAnchor }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTSourceAnchor >> copyFrom: aStartPos to: anEndPos [


	^ (self sourceText copyFrom: aStartPos - self startPos to: anEndPos - self startPos)
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTSourceAnchor >> findAllOccurrencesOfVariableNamed: aString [
	"the name of the variable. Cannot be surrounded by other 'word character' (else we can grep others variables)"

	^ (self sourceText removeComment allRangesOfSubstringNoSurrouned: aString) collect: [ :positions | positions first + self startPos ]
]
