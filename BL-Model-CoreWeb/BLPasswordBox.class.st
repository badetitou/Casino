Class {
	#name : #BLPasswordBox,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLPasswordBox class >> annotation [
	<MSEClass: #BLPasswordBox super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLPasswordBox >> getDom [
	^ '<' ,  self getListPropertiesAsString , ' />'
]

{ #category : #'as yet unclassified' }
BLPasswordBox >> getSelector [
	^ 'input'
]
