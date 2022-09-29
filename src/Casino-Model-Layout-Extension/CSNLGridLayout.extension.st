Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLGridLayout >> verticalVeryDeepCopy [

	| layoutCopy dicCopy |
	layoutCopy := self class new.
	self mooseModel ifNotNil: [ :model | model add: layoutCopy ].
	dicCopy := self attributeAt: #cellPosition ifAbsent: Dictionary new.
	dicCopy keysAndValuesDo: [ :key :value | 
		| cellCopy |
		cellCopy := key verticalVeryDeepCopy.
		(layoutCopy attributeAt: #cellPosition ifAbsentPut: Dictionary new)
			at: cellCopy
			put: value.
		layoutCopy addCell: cellCopy ].
	^ layoutCopy
]
