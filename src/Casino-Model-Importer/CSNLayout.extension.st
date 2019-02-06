Extension { #name : #CSNLayout }

{ #category : #'*Casino-Model-Importer' }
CSNLayout >> addWidget: aWidget [
	self cell add: (CSNCell new widget: aWidget; yourself).
	^ aWidget
	
]

{ #category : #'*Casino-Model-Importer' }
CSNLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
	^ self addWidget: aWidget.
]
