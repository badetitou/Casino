Extension { #name : #BLFileUpload }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFileUpload class >> canHandle: anInvocation [
	^ 'BLFileUpload*|BLImageUploadPanel' asRegex matchesPrefix: anInvocation invokedClassName
]
