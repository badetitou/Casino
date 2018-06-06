Extension { #name : #BLTextBoxDate }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxDate class >> canHandle: anInvocation [
	^ ('BLTextBoxDate|BLTextBoxDatePicker' substrings: '|') includes: anInvocation invokedClassName
]
