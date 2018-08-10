Class {
	#name : #BLTextBoxDate,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLTextBoxDate class >> annotation [
	<MSEClass: #BLTextBoxDate super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #adding }
BLTextBoxDate >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLCalendarShowIcon newFor: self)
]

{ #category : #accessing }
BLTextBoxDate >> getExternalDependency [
	^ {PNGCalendar}
]

{ #category : #'as yet unclassified' }
BLTextBoxDate >> getSelector [
	^ 'p-calendar'
]
