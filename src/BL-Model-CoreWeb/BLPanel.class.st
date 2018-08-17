Class {
	#name : #BLPanel,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLPanel class >> annotation [
	<MSEClass: #BLPanel super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #testing }
BLPanel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLWidth and: [ blAttributeClass ~= BLEnable ]
]

{ #category : #'as yet unclassified' }
BLPanel >> getSelector [
	^ 'bl-panel'
]
