Extension { #name : #CSNUIVerticalLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNUIVerticalLayout >> childAttribute [
	^ CSNUIClass new attributeValue: 'p-col-12'
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNUIVerticalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition ]
]
