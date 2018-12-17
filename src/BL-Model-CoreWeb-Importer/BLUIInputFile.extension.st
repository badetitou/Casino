Extension { #name : #BLUIInputFile }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputFile class >> canHandle: anInvocation [
	^ 'BLFileUpload*|BLImageUploadPanel' asRegex matchesPrefix: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputFile class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'file'.
	^ widget
]
