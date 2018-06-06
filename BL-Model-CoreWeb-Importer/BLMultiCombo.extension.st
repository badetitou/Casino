Extension { #name : #BLMultiCombo }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLMultiCombo class >> canHandle: anInvocation [
	^ 'BLMultiCombo' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLMultiCombo class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #multiple
		put: 'multiple'.
	^ widget
]
