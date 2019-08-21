Extension { #name : #CSNUIInputPassword }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputPassword class >> canHandle: anInvocation [
	^ #('BLPasswordBox' 'PasswordTextBox') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputPassword class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'password'.
	^ widget
]
