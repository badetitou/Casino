Extension { #name : #BLHTML }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLHTML class >> canHandle: anInvocation [
	^ 'HTML' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLHTML class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addWidget:
			(BLUILeaf new
				text:
					(anInvocation parameters
						at: 1
						ifAbsent: ['' ])).
	^ widget
]
