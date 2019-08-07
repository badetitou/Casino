Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget [
	| createdCell |
	createdCell := self mooseModel add: (CSNLCell new widget: aWidget; yourself).
	self cell add: createdCell.
	^ aWidget
	
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
	^ self addWidget: aWidget.
]
