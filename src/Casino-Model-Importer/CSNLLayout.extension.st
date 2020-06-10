Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget [
	^ (self allParents , {self} includes: aWidget)
		ifFalse: [ (aWidget isKindOf: CSNLCell)
				ifTrue: [ self addCell: aWidget ]
				ifFalse: [ | createdCell |
					createdCell := self mooseModel
						add:
							(CSNLCell new
								widget: aWidget;
								yourself).
					self addCell: createdCell ] ]
			ifTrue: [ ('CSNLayout ', aWidget printString , ' is already present in the hierarchy') record ]
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
	^ self addWidget: aWidget.
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout class >> newFrom: anInvocation for: aWidgetInstance withImporters: aCollectionOfImporter [
	self subclasses do: [ :subclass | aCollectionOfImporter do: [ :importer | (subclass accept: importer) ifNotNil: [ :newLayout | ^ newLayout ] ] ].
	^ nil
]
