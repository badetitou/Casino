Extension { #name : #BLTextBoxNumber }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxNumber class >> canHandle: anInvocation [
	^ 'BLTextBoxNumber' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxNumber class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'number'.
	^ widget
]
