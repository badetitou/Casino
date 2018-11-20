Extension { #name : #BLUIInputColor }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputColor class >> canHandle: anInvocation [
	^ 'BLTextBoxColorPicker' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputColor class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'color'.
	^ widget
]
