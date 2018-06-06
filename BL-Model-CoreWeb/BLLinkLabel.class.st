Class {
	#name : #BLLinkLabel,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLLinkLabel class >> annotation [
	<MSEClass: #BLLinkLabel super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLLinkLabel >> getSelector [
	^ 'bl-simple-link'
]
