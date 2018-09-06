Extension { #name : #BLUITextarea }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITextarea class >> canHandle: anInvocation [
	^ #('BLTextArea' 'TextArea') includes: anInvocation invokedClassName
]
