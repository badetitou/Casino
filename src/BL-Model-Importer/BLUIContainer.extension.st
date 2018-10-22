Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Importer' }
BLUIContainer >> addAllWidgets: aCollectionOfWidget [

	aCollectionOfWidget do: [ :aWidget | self addWidget: aWidget ]
]

{ #category : #'*BL-Model-Importer' }
BLUIContainer >> addWidget: aWidget [
	self layout ifNotNil: [ self layout addWidget: aWidget ] ifNil: [ widgets add: aWidget ]
]

{ #category : #'*BL-Model-Importer' }
BLUIContainer >> computeSelfAttributes [
	^ self layout ifNil: [ super computeSelfAttributes ] ifNotNil: [:lay | ^ {super computeSelfAttributes. lay getLayoutAttribute} ]

]
