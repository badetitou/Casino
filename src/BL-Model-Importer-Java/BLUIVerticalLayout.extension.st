Extension { #name : #BLUIVerticalLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIVerticalLayout >> childAttribute [
	^ BLUIClass new text: 'ui-g-12'
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIVerticalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition  ]
]
