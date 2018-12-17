Class {
	#name : #BLOpen,
	#superclass : #BLVariableAttribute,
	#category : #'BL-Model-CoreWeb-Attribute'
}

{ #category : #accessing }
BLOpen >> attributeValue [
	"inverse for core3 vs core2... I don't know why"

	^ attributeValue = 'true'
		ifTrue: [ ^ 'false' ]
		ifFalse: [ ^ 'true' ]
]

{ #category : #accessing }
BLOpen >> name [
	^ 'collapsed'
]
