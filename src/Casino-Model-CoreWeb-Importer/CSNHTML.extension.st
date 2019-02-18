Extension { #name : #CSNHTML }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNHTML class >> canHandle: anInvocation [
	^ 'HTML' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNHTML class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addWidget:
			(CSNUILeaf new
				text:
					(anInvocation parameters
						at: 1
						ifAbsent: ['' ])).
	^ widget
]
