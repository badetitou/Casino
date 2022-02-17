Extension { #name : #CSNLHorizontalLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLHorizontalLayout >> childAttribute [
	| subset |
	(self container attributes select: [ :a | a isKindOf: CSNUIWidth ]) ifNotEmpty: [ ^ {} ].
	subset := 12 / self cell size.
	subset := subset < 1
		ifTrue: [ 1 ]
		ifFalse: [ subset floor ].
	^ CSNUIClass new attributeValue: 'col-' , subset asString
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLHorizontalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition ]
]
