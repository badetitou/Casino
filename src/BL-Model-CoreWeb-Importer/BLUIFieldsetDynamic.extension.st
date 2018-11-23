Extension { #name : #BLUIFieldsetDynamic }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldsetDynamic class >> canHandle: anInvocation [
	self flag: 'We can remove this class'.
	^ false
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldsetDynamic >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLUIDisabled
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldsetDynamic class >> createWidgetFor: anInvocation [
	"We don't use super call because the java constructor is different"

	| widget |
	widget := self new
		realClass: anInvocation invokedClass;
		name: anInvocation asString;
		source: anInvocation;
		yourself.
	widget
		addAttribute: (BLUITitle new text: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ])).
	widget layout: (BLLayout newCoreLayoutFor: anInvocation).
	^ widget
]
