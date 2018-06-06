Class {
	#name : #BLLinkButton,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLLinkButton class >> annotation [
	<MSEClass: #BLLinkButton super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLLinkButton >> getSelector [
	^ 'bl-button-link'
]
