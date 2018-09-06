Extension { #name : #BLUITextarea }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITextarea class >> canHandle: anInvocation [
	^ ('BLTextArea|TextArea' substrings: '|') includes: anInvocation invokedClassName
]
