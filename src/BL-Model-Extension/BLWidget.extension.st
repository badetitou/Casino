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
	<MSEProperty: #addingPosition type: #Number>
	^ self privateState
		attributeAt: #addingPosition
		ifAbsent: ((self source) ifNil: [ 0 ] ifNotNil: [ :widgetSource | widgetSource sourceAnchor ifNil: [ 0 ] ifNotNil: [ :sourceText | sourceText startPos ] ] )
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> addingPosition: anObject [
	self privateState attributeAt: #addingPosition put: anObject
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> canHaveAttribute: blAttributeClass [
	^ true
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> isContainer [
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
BLWidget >> subWidgets [
	^ self widgets
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> widgets [
	^ { } asOrderedCollection 
]
