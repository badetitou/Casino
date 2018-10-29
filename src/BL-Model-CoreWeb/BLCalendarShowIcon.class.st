Class {
	#name : #BLCalendarShowIcon,
	#superclass : #BLVariableAttribute,
	#category : 'BL-Model-CoreWeb-Attribute'
}

{ #category : #'as yet unclassified' }
BLCalendarShowIcon class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'showIcon';
		attributeValue: 'true';
		widget: aWidgetInstance;
		yourself
]

{ #category : #'instance creation' }
BLCalendarShowIcon class >> newFor: aWidgetInstance [
	"black magic... can receive nil as anInvocation see BLHorizontalPanel>>addDefaultAttribute"

	"aWidgetInstance widgets
		do:
			[ :subWidget | subWidget addAttribute: (BLHorizontalChild new subpart: 12 / aWidgetInstance widgets size) ]."

	^ self createAttributeFrom: nil for: aWidgetInstance
]
