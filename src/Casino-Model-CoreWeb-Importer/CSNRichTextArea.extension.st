Extension { #name : #CSNRichTextArea }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNRichTextArea class >> canHandle: anInvocation [
	^ #('BLRTFWithToolbar') includes: anInvocation invokedClassName
]
