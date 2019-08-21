Extension { #name : #CSNUIInputColor }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputColor class >> canHandle: anInvocation [
	^ 'BLTextBoxColorPicker' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputColor class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'color'.
	^ widget
]
