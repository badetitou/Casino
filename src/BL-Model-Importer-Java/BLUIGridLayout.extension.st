Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	| tmpCell |
	anInvocation
		ifNil: [ self addWidget: aWidget ]
		ifNotNil: [ | param |
			anInvocation ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
			"widget on the grid"
			param := anInvocation parameters.
			tmpCell := BLCell new
				widget: aWidget;
				yourself.
			(self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) add: tmpCell -> anInvocation.

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
		ifFalse: [ anAssocWidgetArrayOrArrayValue key widget ifNotNil: [ :widget | widget addingPosition ] ifNil: [ anAssocWidgetArrayOrArrayValue value sourceAnchor startPos ] ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> getLayoutAttribute [
	^ {}
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> postImport [
	"try to dispose the elements by looking the addMethod position and the call of the met getNumberOfRow"
	| sortedAssociations |
	sortedAssociations := self sortedAssociations.
	sortedAssociations ifNotEmpty: [ 
		| currentInvocation previousInvocations |
		currentInvocation := sortedAssociations first value.
		sortedAssociations first value: (self determineXandYfrom: currentInvocation andPrevious: nil).
		previousInvocations := currentInvocation.
	2 to: sortedAssociations size do: 
		[ :index | 
			currentInvocation := (sortedAssociations at: index) value.
			(sortedAssociations at: index) value: (self determineXandYfrom: currentInvocation andPrevious: previousInvocations).
			previousInvocations := currentInvocation ]]
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> sortedAssociations [
	^ {((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) associations "select: [ :assoc | assoc key widget isNotNil ]" ).
	(self privateState attributeAt: #cellHorizontalSpan ifAbsentPut: [ Dictionary new ]) associations.
	(self privateState attributeAt: #cellVerticalSpan ifAbsentPut: [ Dictionary new ]) associations} flatten
		sort:
			[ :assocWidgetArrayOrArrayValue1 :assocWidgetArrayOrArrayValue2 | (self extractAddingPosition: assocWidgetArrayOrArrayValue1) < (self extractAddingPosition: assocWidgetArrayOrArrayValue2) ]
]
