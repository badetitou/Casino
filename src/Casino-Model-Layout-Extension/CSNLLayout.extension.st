Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLLayout >> layoutWidgets [
	^ self cell collect: #widget
]

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLLayout >> verticalVeryDeepCopy [

	| layoutCopy |
	layoutCopy := self class new.
	self mooseModel ifNotNil: [ :model | model add: layoutCopy ].
	self cell do: [ :aCell | 
		layoutCopy addCell: aCell verticalVeryDeepCopy ].
	^ layoutCopy
]
