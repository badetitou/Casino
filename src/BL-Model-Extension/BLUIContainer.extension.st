Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> isContainer [
	^ true
]

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> recursiveElements [
	| widgs |
	widgs := self widgets
		,
			(self layout ifNotNil: [ :a | {a. a cell.a cell collect: #widget thenReject: #isNil} flattened ] ifNil: [ {} ]).
	^ widgs , (widgs select: #isWidget thenCollect: #recursiveElements)
]

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> recursiveWidgets [
	| widgs |
	widgs := self widgets
		,
			(self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [ {} ]).
	^ widgs , (widgs collect: #recursiveWidgets)
]

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> subWidgets [
	^ (self widgets, (self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [{}])) flattened.
]
