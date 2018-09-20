Class {
	#name : #BLTextBoxPeriode,
	#superclass : #BLTextBoxDate,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #adding }
BLTextBoxPeriode >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLCalendarShowIcon newFor: self)
]

{ #category : #adding }
BLTextBoxPeriode >> getExternalDependency [
	^ {PNGCalendar}
]

{ #category : #adding }
BLTextBoxPeriode >> getSelector [
	^ 'p-calendar'
]
