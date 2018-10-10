Extension { #name : #BLUIHorizontalLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIHorizontalLayout >> childAttribute [
	| subset |
	subset := 12 / (self cell) size.
				subset := subset < 1
					ifTrue: [ 1 ]
					ifFalse: [ subset floor ].
	^ BLUIClass new text: 'ui-g-', (subset asString )
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIHorizontalLayout >> postImport [
	"If we need to order some of the cell"
	cell := self cell asOrderedCollection
		sort: [ :cell1 :cell2 | 
			cell1 first addingPosition 
				< cell2 first addingPosition  ]
]
