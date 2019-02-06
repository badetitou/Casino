Class {
	#name : #CSNOpen,
	#superclass : #CSNVariableAttribute,
	#category : #'Casino-Model-CoreWeb-Attribute'
}

{ #category : #accessing }
CSNOpen >> attributeValue [
	"inverse for core3 vs core2... I don't know why"

	^ attributeValue = 'true'
		ifTrue: [ ^ 'false' ]
		ifFalse: [ ^ 'true' ]
]

{ #category : #accessing }
CSNOpen >> name [
	^ 'collapsed'
]
