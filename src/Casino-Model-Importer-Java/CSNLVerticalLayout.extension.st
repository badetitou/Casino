Extension { #name : #CSNLVerticalLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLVerticalLayout >> childAttribute [
	^ CSNUIClass new attributeValue: 'col-12 pb-3'
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLVerticalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition ]
]
