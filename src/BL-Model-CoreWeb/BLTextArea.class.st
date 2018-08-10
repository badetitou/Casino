Class {
	#name : #BLTextArea,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLTextArea class >> annotation [
	<MSEClass: #BLTextArea super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLTextArea >> getSelector [
	^ 'textarea'
]
