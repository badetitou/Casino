Class {
	#name : #BLImage,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLImage class >> annotation [
	<MSEClass: #BLImage super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLImage >> getDom [
	^ '<' ,  self getListPropertiesAsString , ' />'
]

{ #category : #'as yet unclassified' }
BLImage >> getSelector [
	^ 'img'
]
