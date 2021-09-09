Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addAllWidgets: aCollectionOfWidget [

	aCollectionOfWidget do: [ :aWidget | self addWidget: aWidget ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addWidget: aWidget [
	((self allParents , {self}) includes: aWidget)
		ifFalse: [ self layout
				ifNotNil: [ :layout | layout addWidget: aWidget withInvocationOfAdd: nil usingFactory: nil ]
				ifNil: [ self widgets add: aWidget ] ]
		ifTrue: [ ('CSNContainer: ', aWidget printString , ' is already present in the hierarchy') record ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	(self allParents , {self} includes: aWidget)
		ifFalse: [ aWidget addingPosition: anInvocation sourceAnchor startPos.
			self layout
				ifNotNil: [ :layout | layout addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory ]
				ifNil: [ self addWidget: aWidget ] ]
		ifTrue: [ ('CSNContainer - AddWidgetWithInvocation: ' , aWidget printString , ' is already present in the hierarchy') record ]
]

{ #category : #'*Casino-Model-Importer' }
CSNContainer >> computeSelfAttributes [
	^ self layout ifNil: [ super computeSelfAttributes ] ifNotNil: [:lay | ^ {super computeSelfAttributes. lay getLayoutAttribute} ]

]
