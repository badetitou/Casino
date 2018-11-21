Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget [
	self cell add: (BLCell new widget: aWidget; yourself).
	^ aWidget
	
]

{ #category : #'*BL-Model-Importer' }
BLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
	^ self addWidget: aWidget.
]
