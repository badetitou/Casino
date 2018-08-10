Class {
	#name : #BLHorizontalParent,
	#superclass : #BLNormalAttribute,
	#category : 'BL-Model-CoreWeb-Attribute'
}

{ #category : #'as yet unclassified' }
BLHorizontalParent class >> createAttributeFor: anInvocation [
	^ BLGridElement createAttributeFor: nil
]

{ #category : #'instance creation' }
BLHorizontalParent class >> newFor: aWidgetInstance [
	"black magic... can receive nil as anInvocation see BLHorizontalPanel>>addDefaultAttribute"

	aWidgetInstance widgets
		do:
			[ :subWidget | subWidget addAttribute: (BLHorizontalChild new subpart: 12 / aWidgetInstance widgets size) ].
	^ self createAttributeFor: nil
]
