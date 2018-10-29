Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> canHaveAttribute: blAttributeClass [
	^ true
]

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> recursiveWidgets [
	| widgs |
	widgs := (self widgets, (self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [{}])) flattened.
	^ (widgs, (widgs collect: #recursiveWidgets)) flattened
]

{ #category : #'*BL-Model-Extension' }
BLUIContainer >> subWidgets [
	^ (self widgets, (self layout ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ] ifNil: [{}])) flattened.
]
