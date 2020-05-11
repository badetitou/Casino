Extension { #name : #FAMIXLocalVariable }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXLocalVariable >> shortName [
	^ self name 
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXLocalVariable >> uniqueName [
	| dic |
	dic := (self allAtScope: FamixTMethod) last privateState cacheAt: #uniqueName ifAbsentPut: [ {(self -> self name)} asDictionary ].
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
