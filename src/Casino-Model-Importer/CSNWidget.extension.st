Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Importer' }
CSNWidget classSide >> initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance [
	aCollectionOfImporter
		do: [ :importer | 
			importer
				entity: aWidgetInstance;
				source: anInvocation ]
]

{ #category : #'*Casino-Model-Importer' }
CSNWidget classSide >> newFrom: anInvocation for: aWidgetInstance withImporters: aCollectionOfImporter [
	self initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance.
	self subclasses
		do: [ :subclass | 
			(subclass newFrom: anInvocation for: aWidgetInstance withImporters: aCollectionOfImporter) ifNotNil: [ :newWidget | ^ newWidget ].
			aCollectionOfImporter do: [ :importer | (subclass accept: importer) ifNotNil: [ :newWidget | ^ newWidget ] ] ].
	^ nil
]

{ #category : #'*Casino-Model-Importer' }
CSNWidget >> postImport [
	
]
