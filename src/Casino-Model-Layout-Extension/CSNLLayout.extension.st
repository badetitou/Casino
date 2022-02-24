Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLLayout >> layoutWidgets [
	^ self cell collect: #widget
]

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLLayout >> verticalVeryDeepCopy [

	| layoutCopy |
	layoutCopy := self class new.
	self cell do: [ :aCell | 
		layoutCopy addCell: aCell verticalVeryDeepCopy ].
	^ layoutCopy
]
