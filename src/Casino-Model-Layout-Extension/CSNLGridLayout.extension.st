Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLGridLayout >> verticalVeryDeepCopy [

	| layoutCopy |
	layoutCopy := super verticalVeryDeepCopy.
	layoutCopy
		attributeAt: #cellPosition
		put:
		(self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]).
	^ layoutCopy
]
