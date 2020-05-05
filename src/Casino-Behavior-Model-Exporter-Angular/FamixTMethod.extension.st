Extension { #name : #FamixTMethod }

{ #category : #'*Casino-Behavior-Model-Exporter-Angular' }
FamixTMethod >> uniqueNameInPage: aPage [
	| dic |
	dic := aPage privateState cacheAt: #uniqueName ifAbsentPut: [ {(self -> self name)} asDictionary ].
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
