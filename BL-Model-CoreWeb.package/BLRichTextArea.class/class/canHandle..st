testing
canHandle: anInvocation
	^ 'BLRTFWithToolbar|BLRichTextArea|RichTextArea' asRegex matchesPrefix: anInvocation invokedClassName