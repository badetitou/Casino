Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget [
	self cell add: (CSNLCell new widget: aWidget; yourself).
	^ aWidget
	
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
	^ self addWidget: aWidget.
]
