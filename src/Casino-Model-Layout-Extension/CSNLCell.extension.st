Extension { #name : #CSNLCell }

{ #category : #'*Casino-Model-Layout-Extension' }
CSNLCell >> verticalVeryDeepCopy [

	| cellCopy |
	cellCopy := super verticalVeryDeepCopy.
	cellCopy widget: self widget verticalVeryDeepCopy.
	^ cellCopy
]
