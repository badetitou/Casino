Extension { #name : #CSNLAlignement }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNLAlignement classSide >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNLAlignement: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNLAlignement >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNLAlignement: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNLAlignement classSide >> initializeImporters: aCollectionOfImporter withInvocation: anInvocation andFor: aWidgetInstance [
	aCollectionOfImporter
		do: [ :importer | 
			importer
				entity: aWidgetInstance;
				source: anInvocation ]
]

{ #category : #'*Casino-Model-Visitor' }
CSNLAlignement classSide >> newFrom: anAlignementIdentifier withImporters: visitorImporters [
	| updatedVisitor |
	updatedVisitor := visitorImporters collect: [ :visitor | visitor clone source: anAlignementIdentifier; yourself ].
	self subclasses 
		do: [ :subclass | updatedVisitor 
			do: [ :importer | (subclass accept: importer) ifNotNil: [ :newWidget | ^ newWidget ] 
				] 
			].
	^ nil
]
