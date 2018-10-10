Extension { #name : #BLUIVerticalLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIVerticalLayout >> postImport [
	"If we need to order some of the cell"
	cell := self cell asOrderedCollection
		sort: [ :cell1 :cell2 | 
			cell1 first addingPosition 
				< cell2 first addingPosition  ]
]
