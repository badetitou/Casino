Extension { #name : #BLPasswordBox }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLPasswordBox class >> canHandle: anInvocation [
	^ ('BLPasswordBox|PasswordTextBox' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLPasswordBox class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'password'.
	^ widget
]
