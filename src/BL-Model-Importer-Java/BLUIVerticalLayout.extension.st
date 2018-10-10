Extension { #name : #BLUIVerticalLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIVerticalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widgets isEmpty ])
		sort: [ :cell1 :cell2 | 
			cell1 widgets first addingPosition 
				< cell2 widgets first addingPosition  ]
]
