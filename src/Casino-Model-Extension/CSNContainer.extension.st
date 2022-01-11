Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Extension' }
CSNContainer >> isContainer [
	^ true
]

{ #category : #'*Casino-Model-Extension' }
CSNContainer >> recursiveElements [
	| widgs |
	widgs := self widgets
		,
			(self layout ifNotNil: [ :a | {a. a cell.a cell collect: #widget thenReject: #isNil} flattened ] ifNil: [ {} ]).
	^ widgs , (widgs select: #isWidget thenCollect: #recursiveElements)
]

{ #category : #'*Casino-Model-Extension' }
CSNContainer >> recursiveWidgets [

	| widgs |
	widgs := self widgets , (self layout
		          ifNotNil: [ :a | 
		          a cell collect: #widget thenReject: #isNil ]
		          ifNil: [ {  } ]) reject: [ :el | el = self ].
	^ widgs , (widgs collect: #recursiveWidgets)
]

{ #category : #'*Casino-Model-Extension' }
CSNContainer >> subWidgets [
	^ (self widgets, (self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [{}])) flattened.
]
