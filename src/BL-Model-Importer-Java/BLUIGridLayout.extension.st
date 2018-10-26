Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	| tmpCell |
	anInvocation
		ifNil: [ super addWidget: aWidget withInvocationOfAdd: anInvocation ]
		ifNotNil: [ :invoc | 
			| param |
			"widget on the grid"
			param := invoc parameters.
			tmpCell := BLCell new
				widget: aWidget;
				yourself.
			(self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
				add:
					tmpCell
						->
							{((param at: 1) asInteger ifNil: [ 0 ]).	"row"
							(param at: 2) asInteger}.	"column"

			"alignement of the widget"
			aWidget position: (param size >= 4
				ifTrue: [ ((param at: 4) beginsWith: 'HasHorizontalAlignment.')
						ifTrue: [ BLAlignement createAlignementWithHorizontal: (param at: 4) andVertical: (param at: 5 ifAbsent: [ nil ]) ]
						ifFalse: [ BLAlignement createAlignementWithHorizontal: (param at: 5 ifAbsent: [ nil ]) andVertical: (param at: 4) ] ]
				ifFalse: [ nil ]).
			cell add: tmpCell ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> childAttributeFor: aCell [
	| subset |
	subset := 12 / ((self atLevel: ((self privateState attributeAt: #cellPosition ifAbsent: [^ {}]) at: aCell) first) size).
	subset := subset < 1
		ifTrue: [ 1 ]
		ifFalse: [ subset floor ].
	^ BLUIClass new text: 'ui-g-' , subset asString
]
