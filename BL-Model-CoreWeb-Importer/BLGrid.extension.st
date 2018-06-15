Extension { #name : #BLGrid }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLGrid class >> canHandle: anInvocation [
	^ ('BLFlexTable|BLGrid' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLGrid class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	^ widget
]
