Extension { #name : #CSNLCell }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLCell >> container [
	^ self layoutOwner ifNil: [ self widgetContainer ]
]

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLCell >> verticalVeryDeepCopy [

	| cellCopy |
	cellCopy := super verticalVeryDeepCopy.
	cellCopy widget: self widget verticalVeryDeepCopy.
	^ cellCopy
]
