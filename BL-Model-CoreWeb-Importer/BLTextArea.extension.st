Extension { #name : #BLTextArea }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextArea class >> canHandle: anInvocation [
	^ ('BLTextArea|TextArea' substrings: '|') includes: anInvocation invokedClassName
]
