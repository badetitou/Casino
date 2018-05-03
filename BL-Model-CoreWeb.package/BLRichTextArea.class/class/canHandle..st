testing
canHandle: anInvocation
	^ 'BLRichTextArea|RichTextArea' match: anInvocation invokedClass name