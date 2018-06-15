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
BLGrid >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLGridElement newFor: self)
]

{ #category : #'as yet unclassified' }
BLGrid >> addWidget: aWidget [
	self halt. 
	widgets add: aWidget
]

{ #category : #'as yet unclassified' }
BLGrid >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	self halt. 
	
	self addWidget: aWidget
]

{ #category : #'as yet unclassified' }
BLGrid >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable 
]

{ #category : #'as yet unclassified' }
BLGrid >> getSelector [
	^ 'div'
]
