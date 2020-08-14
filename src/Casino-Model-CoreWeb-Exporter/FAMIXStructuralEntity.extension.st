Extension { #name : #FAMIXStructuralEntity }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXStructuralEntity >> uniqueName [
	| dic |
	dic := ((self allAtScope: FamixTClass) detect: [:class | class parents anyOneIfOnlyOneElement isNamespace]) privateState cacheAt: #uniqueName ifAbsentPut: [ {(self -> self name)} asDictionary ].
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
FAMIXStructuralEntity >> uniqueName: aString [
	((self allAtScope: FamixTClass) detect: [:class | class parents anyOneIfOnlyOneElement isNamespace]) privateState cacheAt: #uniqueName put: {(self -> aString)} asDictionary
]
