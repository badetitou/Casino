Class {
	#name : #BLGrid,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLGrid class >> annotation [
	<MSEClass: #BLGrid super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLGrid >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable 
]

{ #category : #'as yet unclassified' }
BLGrid >> getSelector [
	^ 'div'
]
