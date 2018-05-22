testing
canHandle: anInvocation
	^ ('BLRTFWithToolbar|BLRichTextArea|RichTextArea' substrings: '|') includes: anInvocation invokedClassName