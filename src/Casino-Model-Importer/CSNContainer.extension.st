Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addAllWidgets: aCollectionOfWidget [

	aCollectionOfWidget do: [ :aWidget | self addWidget: aWidget ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addWidget: aWidget [
	self layout ifNotNil: [ self layout addWidget: aWidget withInvocationOfAdd: nil ] ifNil: [ widgets add: aWidget ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	aWidget addingPosition: anInvocation sourceAnchor startPos.
	self addWidget: aWidget
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> computeSelfAttributes [
	^ self layout ifNil: [ super computeSelfAttributes ] ifNotNil: [:lay | ^ {super computeSelfAttributes. lay getLayoutAttribute} ]

]
