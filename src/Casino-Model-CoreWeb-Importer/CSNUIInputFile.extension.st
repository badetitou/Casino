Extension { #name : #CSNUIInputFile }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputFile class >> canHandle: anInvocation [
	^ 'BLFileUpload*|BLImageUploadPanel|BLFileUploadPanelLink' asRegex matchesPrefix: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputFile class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'file'.
	^ widget
]
