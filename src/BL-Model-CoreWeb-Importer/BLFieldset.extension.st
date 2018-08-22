Extension { #name : #BLFieldset }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFieldset class >> canHandle: anInvocation [
	^ 'BLFieldSetPanel' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFieldset class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #title put: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ]).
	(anInvocation parameters size >= 2)
		ifTrue: [ widget parameters at: #width put: (anInvocation parameters at: 2) ].
	^ widget
]
