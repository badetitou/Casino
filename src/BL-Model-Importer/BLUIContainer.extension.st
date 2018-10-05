Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Importer' }
BLUIContainer >> addAllWidgets: aCollectionOfWidget [

	aCollectionOfWidget do: [ :aWidget | self addWidget: aWidget ]
]

{ #category : #'*BL-Model-Importer' }
BLUIContainer >> addWidget: aWidget [
	widgets add: aWidget
]
