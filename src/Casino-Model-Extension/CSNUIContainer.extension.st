Extension { #name : #CSNUIContainer }

{ #category : #'*Casino-Model-Extension' }
CSNUIContainer >> isContainer [
	^ true
]

{ #category : #'*Casino-Model-Extension' }
CSNUIContainer >> recursiveElements [
	| widgs |
	widgs := self widgets
		,
			(self layout ifNotNil: [ :a | {a. a cell.a cell collect: #widget thenReject: #isNil} flattened ] ifNil: [ {} ]).
	^ widgs , (widgs select: #isWidget thenCollect: #recursiveElements)
]

{ #category : #'*Casino-Model-Extension' }
CSNUIContainer >> recursiveWidgets [
	| widgs |
	widgs := self widgets
		,
			(self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [ {} ]).
	^ widgs , (widgs collect: #recursiveWidgets)
]

{ #category : #'*Casino-Model-Extension' }
CSNUIContainer >> subWidgets [
	^ (self widgets, (self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [{}])) flattened.
]
