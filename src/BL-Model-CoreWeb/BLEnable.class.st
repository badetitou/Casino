Class {
	#name : #BLEnable,
	#superclass : #BLVariableAttribute,
	#category : 'BL-Model-CoreWeb-Attribute'
}

{ #category : #'as yet unclassified' }
BLEnable >> attributeValue [
	"inverse for core3 vs core2... I don't know why"

	^ attributeValue = 'true'
		ifTrue: [ ^ 'false' ]
		ifFalse: [ ^ 'true' ]
]

{ #category : #'as yet unclassified' }
BLEnable >> name [
	^ 'disabled'
]
