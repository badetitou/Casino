Extension { #name : #CSNLHorizontalLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLHorizontalLayout >> childAttribute [

	^ CSNUIClass new attributeValue: 'col'
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLHorizontalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition ]
]
