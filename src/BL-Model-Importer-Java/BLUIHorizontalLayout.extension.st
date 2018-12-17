Extension { #name : #BLUIHorizontalLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIHorizontalLayout >> childAttribute [
	| subset |
	(self container attributes select: [ :a | a isKindOf: BLUIWidth ]) ifEmpty: [ ^ {} ].
	subset := 12 / self cell size.
	subset := subset < 1
		ifTrue: [ 1 ]
		ifFalse: [ subset floor ].
	^ BLUIClass new attributeValue: 'p-col-' , subset asString
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIHorizontalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition ]
]
