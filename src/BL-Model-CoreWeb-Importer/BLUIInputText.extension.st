Extension { #name : #BLUIInputText }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputText class >> canHandle: anInvocation [
	^ #('BLTextBox' 'TextBox') includes: anInvocation invokedClassName
]
