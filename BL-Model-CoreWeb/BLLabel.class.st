Class {
	#name : #BLLabel,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLLabel class >> annotation [
	<MSEClass: #BLLabel super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #testing }
BLLabel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #'as yet unclassified' }
BLLabel >> getSelector [
	^ 'p'
]
