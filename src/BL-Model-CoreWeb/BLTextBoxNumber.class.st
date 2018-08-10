Class {
	#name : #BLTextBoxNumber,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLTextBoxNumber class >> annotation [
	<MSEClass: #BLTextBoxNumber super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLTextBoxNumber >> getDom [
	^ '<' ,  self getListPropertiesAsString, ' />'
]

{ #category : #'as yet unclassified' }
BLTextBoxNumber >> getSelector [
	^ 'input'
]
