Extension { #name : #BLUIInputPassword }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputPassword class >> canHandle: anInvocation [
	^ #('BLPasswordBox' 'PasswordTextBox') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputPassword class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'password'.
	^ widget
]
