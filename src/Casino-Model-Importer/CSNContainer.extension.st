Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addAllWidgets: aCollectionOfWidget [

	aCollectionOfWidget do: [ :aWidget | self addWidget: aWidget ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addWidget: aWidget [

	self layout ifNotNil: [:layout | layout addWidget: aWidget withInvocationOfAdd: nil usingFactory: nil ] ifNil: [ self widgets add: aWidget ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	aWidget addingPosition: anInvocation sourceAnchor startPos.
	self layout
		ifNotNil: [ :layout | layout addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory ]
		ifNil: [ self addWidget: aWidget ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> computeSelfAttributes [
	^ self layout ifNil: [ super computeSelfAttributes ] ifNotNil: [:lay | ^ {super computeSelfAttributes. lay getLayoutAttribute} ]

]
