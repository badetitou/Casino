Extension { #name : #CSNUIHorizontalLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNUIHorizontalLayout >> childAttribute [
	| subset |
	(self container attributes select: [ :a | a isKindOf: CSNUIWidth ]) ifEmpty: [ ^ {} ].
	subset := 12 / self cell size.
	subset := subset < 1
		ifTrue: [ 1 ]
		ifFalse: [ subset floor ].
	^ CSNUIClass new attributeValue: 'p-col-' , subset asString
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNUIHorizontalLayout >> postImport [
	"If we need to order some of the cell"
	cell := (self cell asOrderedCollection reject: [ :a | a widget isNil ])
		sort: [ :cell1 :cell2 | 
			cell1 widget addingPosition 
				< cell2 widget addingPosition ]
]
