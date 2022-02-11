Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLLayout >> layoutWidgets [
	^ self cell collect: #widget
]
