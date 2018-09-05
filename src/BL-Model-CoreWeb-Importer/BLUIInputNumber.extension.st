Extension { #name : #BLUIInputNumber }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputNumber class >> canHandle: anInvocation [
	^ 'BLTextBoxNumber' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputNumber class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'number'.
	^ widget
]
