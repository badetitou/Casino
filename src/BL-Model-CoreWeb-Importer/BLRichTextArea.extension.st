Extension { #name : #BLRichTextArea }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLRichTextArea class >> canHandle: anInvocation [
	^ #('BLRTFWithToolbar') includes: anInvocation invokedClassName
]
