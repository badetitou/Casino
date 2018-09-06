Extension { #name : #BLRichTextArea }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLRichTextArea class >> canHandle: anInvocation [
	^ #('BLRTFWithToolbar' 'BLRichTextArea' 'RichTextArea') includes: anInvocation invokedClassName
]
