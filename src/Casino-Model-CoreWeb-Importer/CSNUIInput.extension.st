Extension { #name : #CSNUIInput }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInput class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInput class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (CSNUIValue new attributeValue: (anInvocation parameters at: 4 ifAbsent: [ '' ])).
	^ widget
]
