Extension { #name : #BLTextBoxTime }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxTime class >> canHandle: anInvocation [
	^ 'BLTextBoxTime' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxTime class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #timeOnly put: 'true'.
	^ widget
]
