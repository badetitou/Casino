Extension { #name : #CSNUITextarea }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUITextarea class >> canHandle: anInvocation [
	^ #('BLTextArea' 'TextArea' 'BLRichTextArea' 'RichTextArea') includes: anInvocation invokedClassName
]
