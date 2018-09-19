Extension { #name : #BLUIFieldset }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldset class >> canHandle: anInvocation [
	^ 'BLFieldSetPanel' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldset >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIFieldset class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget addAttribute: (BLUITitle new text: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ])).
	(anInvocation parameters size >= 2)
		ifTrue: [ widget addAttribute: (BLUIWidth new text: (anInvocation parameters at: 2) )].
	^ widget
]
