Class {
	#name : #CSNUICWOpen,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWOpen class >> annotation [

	<MSEClass: #Open super: #CSNAttribute>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUICWOpen >> attributeValue [
	"inverse for core3 vs core2... I don't know why"

	^ attributeValue = 'true'
		ifTrue: [ ^ 'false' ]
		ifFalse: [ ^ 'true' ]
]

{ #category : #accessing }
CSNUICWOpen >> name [
	^ 'collapsed'
]
