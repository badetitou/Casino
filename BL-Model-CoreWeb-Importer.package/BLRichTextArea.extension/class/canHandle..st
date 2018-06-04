*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLRTFWithToolbar|BLRichTextArea|RichTextArea' substrings: '|') includes: anInvocation invokedClassName