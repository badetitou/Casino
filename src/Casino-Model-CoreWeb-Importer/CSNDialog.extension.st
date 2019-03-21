Extension { #name : #CSNDialog }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNDialog class >> canHandle: anInvocation [
	^ 'BLDialogBox' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNDialog class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #header put: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ]).
	anInvocation parameters size = 1
		ifTrue: [ widget
				addAttribute:
					(CSNModal new
						attributeValue: 'true';
						yourself) ]
		ifFalse: [ widget
				addAttribute:
					(CSNModal new
						attributeValue: anInvocation parameters last;
						yourself) ].
	^ widget
]
