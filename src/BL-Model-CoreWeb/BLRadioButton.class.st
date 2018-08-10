Class {
	#name : #BLRadioButton,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLRadioButton class >> annotation [
	<MSEClass: #BLRadioButton super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLRadioButton >> getDom [
	^ '<' ,  self getListPropertiesAsString , ' />'
]

{ #category : #'as yet unclassified' }
BLRadioButton >> getSelector [
	^ 'input'
]
