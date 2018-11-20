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
				add: tmpCell -> "(self determineXandYfrom:" param")".


			"alignement of the widget"
			aWidget
				position:
					(param size >= 4
						ifTrue: [ ((param at: 4) beginsWith: 'HasHorizontalAlignment.')
								ifTrue: [ BLAlignement createAlignementWithHorizontal: (param at: 4) andVertical: (param at: 5 ifAbsent: [ nil ]) ]
								ifFalse: [ BLAlignement createAlignementWithHorizontal: (param at: 5 ifAbsent: [ nil ]) andVertical: (param at: 4) ] ]
						ifFalse: [ nil ]).
			cell add: tmpCell ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> extractAddingPosition: anAssocWidgetArrayOrArrayValue [
	^ anAssocWidgetArrayOrArrayValue key isInvocation
		ifTrue: [ anAssocWidgetArrayOrArrayValue key sourceAnchor ifNil: [0] ifNotNil: [:sourceText | sourceText startPos ] ]
		ifFalse: [ anAssocWidgetArrayOrArrayValue key widget addingPosition ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> getLayoutAttribute [
	^ {}
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> postImport [
	"try to dispose the elements by looking the addMethod position and the call of the met getNumberOfRow"

	({((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) associations
		select: [ :assoc | assoc key widget isNotNil ]).
	(self privateState attributeAt: #cellHorizontalSpan ifAbsentPut: [ Dictionary new ]) associations.
	(self privateState attributeAt: #cellVerticalSpan ifAbsentPut: [ Dictionary new ]) associations} flatten
		sort:
			[ :assocWidgetArrayOrArrayValue1 :assocWidgetArrayOrArrayValue2 |  (self extractAddingPosition: assocWidgetArrayOrArrayValue1) < (self extractAddingPosition: assocWidgetArrayOrArrayValue2) ]) do: [ :assoc | self determineXandYfrom: assoc value ]
]
