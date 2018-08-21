Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Extension' }
BLWidget >> addAction: anBLAction [
	self actions add: anBLAction 
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> addAttribute: attribute [
	self attributes add: attribute 
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> addingPosition [
	<MSEProperty: #addingPosition type: #Object>
	^ self privateState attributeAt: #addingPosition ifAbsent: (self source sourceAnchor startPos)
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> addingPosition: anObject [
	self privateState attributeAt: #addingPosition put: anObject
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> canHaveAttribute: blAttributeClass [
	^ false
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> parameters [
	<MSEProperty: #parameters type: #Object>
	^ self privateState attributeAt: #parameters ifAbsentPut: [ Dictionary new ]
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> realClass [
	<MSEProperty: #realClass type: #Object>
	^ realClass
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> realClass: aClass [
	realClass := aClass
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> recursiveWidgets [
	^ (self widgets , (self widgets collect: #recursiveWidgets))
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> variable [
	<MSEProperty: #variable type: #Object>
	^ self privateState attributeAt: #variable ifAbsent: nil
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> variable: anObject [
	self privateState attributeAt: #variable put: anObject
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> widgets [
	^ { } asOrderedCollection 
]
