Class {
	#name : #BLHorizontalPanel,
	#superclass : #BLPanel,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLHorizontalPanel class >> annotation [
	<MSEClass: #BLHorizontalPanel super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #adding }
BLHorizontalPanel >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLHorizontalParent newFor: self)
]

{ #category : #testing }
BLHorizontalPanel >> canHaveAttribute: blAttributeClass [
	^  blAttributeClass ~= BLEnable 
]
