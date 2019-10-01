Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Model-Importer' }
CSNAttribute class >> initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance [
	aCollectionOfImporter do: [ :importer | importer entity: aWidgetInstance; source: anInvocation ]
]

{ #category : #'*Casino-Model-Importer' }
CSNAttribute class >> newFrom: anInvocation for: aWidgetInstance withImporters: aCollectionOfImporter [
	self initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance.
	self subclasses 
		do: [ :subclass | aCollectionOfImporter 
			do: [ :importer | (subclass accept: importer) ifNotNil: [ :newWidget | ^ newWidget ] 
				] 
			].
	^ nil
]
