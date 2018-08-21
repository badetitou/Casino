Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Importer-Java' }
BLUIContainer >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	aWidget addingPosition: anInvocation sourceAnchor startPos.
	self addWidget: aWidget
]
