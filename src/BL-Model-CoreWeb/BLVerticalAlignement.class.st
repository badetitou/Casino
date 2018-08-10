Class {
	#name : #BLVerticalAlignement,
	#superclass : #BLNormalAttribute,
	#category : #'BL-Model-CoreWeb-Attribute'
}

{ #category : #meta }
BLVerticalAlignement class >> createAttributeFor: anInvocation [
	^ self new
		name: 'class';
		attributeValue: 'grid';
		yourself
]

{ #category : #meta }
BLVerticalAlignement class >> newFor: aWidgetInstance [

	^ self createAttributeFor: nil
]
