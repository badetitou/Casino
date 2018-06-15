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
BLWidget >> canHaveAttribute: blAttributeClass [
	^ false
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> initialize [
	super initialize.
	parameters := Dictionary new
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> parameters [
	^ parameters
]

{ #category : #'*BL-Model-Extension' }
BLWidget >> parameters: anObject [
	parameters := anObject
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
