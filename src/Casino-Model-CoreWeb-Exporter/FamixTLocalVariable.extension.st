Extension { #name : #FamixTLocalVariable }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FamixTLocalVariable >> shortName [
	^ self name 
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FamixTLocalVariable >> uniqueName [
	| dic |
	dic := (self atScope: FamixTMethod) anyOneIfOnlyOneElement
		cacheAt: #uniqueName
		ifAbsentPut: [ {(self -> self name)} asDictionary ].
	^ dic
		at: self
		ifAbsentPut: [ | index potentialName |
			index := 0.
			potentialName := self shortName.
			[ dic includes: potentialName ]
				whileTrue: [ potentialName := potentialName removeSuffix: index asString.
					index := index + 1.
					potentialName := potentialName , index asString ].
			potentialName ]
]
