Class {
	#name : #BLGridElement,
	#superclass : #BLNormalAttribute,
	#category : #'BL-Model-CoreWeb-Attribute'
}

{ #category : #meta }
BLGridElement class >> createAttributeFor: anInvocation [
	^ self new
		name: 'class';
		attributeValue: 'ui-g';
		yourself
]

{ #category : #meta }
BLGridElement class >> newFor: aWidgetInstance [

	^ self createAttributeFor: nil
]
