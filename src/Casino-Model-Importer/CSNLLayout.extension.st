Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget [

	^ (self allParents , { self } includes: aWidget)
		  ifFalse: [ 
			  (aWidget isKindOf: CSNLCell)
				  ifTrue: [ self addCell: aWidget ]
				  ifFalse: [ 
					  | createdCell myWidget |
					  aWidget container
						  ifNil: [ myWidget := aWidget ]
						  ifNotNil: [ myWidget := aWidget verticalVeryDeepCopy ].
					  createdCell := self mooseModel add: (CSNLCell new
							                  widget: myWidget;
							                  yourself).
					  self addCell: createdCell ] ]
		  ifTrue: [ 
			  ('CSNLayout ' , aWidget printString
			   , ' is already present in the hierarchy') record ]
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
	^ self addWidget: aWidget.
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout class >> initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance [
	aCollectionOfImporter
		do: [ :importer | 
			importer
				entity: aWidgetInstance;
				source: anInvocation ]
]

{ #category : #'*Casino-Model-Importer' }
CSNLLayout class >> newFrom: anInvocation for: aWidgetInstance withImporters: aCollectionOfImporter [
	self initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance.
	self subclasses do: [ :subclass | 
		aCollectionOfImporter do: [ :importer | 
			(subclass accept: importer) ifNotNil: [ :newLayout | ^ newLayout ] ] ].
	^ nil
]
