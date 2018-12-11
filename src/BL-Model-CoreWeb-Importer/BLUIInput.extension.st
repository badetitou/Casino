Extension { #name : #BLUIInput }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInput class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInput class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (BLUIValue new text: (anInvocation parameters at: 4 ifAbsent: [ '' ])).
	^ widget
]
