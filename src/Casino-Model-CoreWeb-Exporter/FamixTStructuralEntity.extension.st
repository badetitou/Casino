Extension { #name : #FamixTStructuralEntity }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FamixTStructuralEntity >> uniqueName [
	| dic |
	dic := ((self allAtScope: FamixTClass)
		detect: [ :class | class parents anyOneIfOnlyOneElement isNamespace ])
		cacheAt: #uniqueName
		ifAbsentPut: [ {(self -> self name)} asDictionary ].
	^ dic
		at: self
		ifAbsentPut: [ | index potentialName |
			index := 0.
			potentialName := self name.
			[ dic includes: potentialName ]
				whileTrue: [ potentialName := potentialName removeSuffix: index asString.
					index := index + 1.
					potentialName := potentialName , index asString ].
			potentialName ]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FamixTStructuralEntity >> uniqueName: aString [

	((self allAtScope: FamixTClass) detect: [ :class | class parents anyOneIfOnlyOneElement isNamespace ])
		cacheAt: #uniqueName
		put: { (self -> aString) } asDictionary
]
