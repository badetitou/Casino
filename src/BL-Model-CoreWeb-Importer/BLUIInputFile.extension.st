Extension { #name : #BLUIInputFile }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputFile class >> canHandle: anInvocation [
	^ 'BLFileUpload*|BLImageUploadPanel' asRegex matchesPrefix: anInvocation invokedClassName
]
