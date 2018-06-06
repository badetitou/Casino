Extension { #name : #BLCheckBox }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCheckBox class >> canHandle: anInvocation [
	^ ('BLCheckBox|CheckBox' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCheckBox class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'checkbox'.
	^ widget
]
