Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLGridLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [
	| tmpCell |
	anInvocation
		ifNil: [ self addWidget: aWidget ]
		ifNotNil: [ | param |
			anInvocation
				ifNotNil: [ aWidget addingPosition: anInvocation sourceAnchor startPos ].
			"widget on the grid"
			param := anInvocation parameters.
			tmpCell := (aFactory create: CSNLCell)
				widget: aWidget;
				yourself.
			(self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
				add: tmpCell -> anInvocation.

			"alignement of the widget"
			aWidget
				position:
					(param size >= 4
						ifTrue: [ ((param at: 4) beginsWith: 'HasHorizontalAlignment.')
								ifTrue: [ CSNLAlignement
										createAlignementWithHorizontal: (param at: 4)
										andVertical: (param at: 5 ifAbsent: [ nil ]) ]
								ifFalse: [ CSNLAlignement
										createAlignementWithHorizontal: (param at: 5 ifAbsent: [ nil ])
										andVertical: (param at: 4) ] ]
						ifFalse: [ nil ]).
			cell add: tmpCell ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLGridLayout >> childAttribute [

	^ { (CSNUIClass new attributeValue: 'col') }
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLGridLayout >> extractAddingPosition: anAssocWidgetArrayOrArrayValue [
	"the first ifTrue is False is only use when we debug to avoid a bug when we restart"
	^  anAssocWidgetArrayOrArrayValue value isArray ifTrue: [ 0 ] ifFalse: [  (anAssocWidgetArrayOrArrayValue value sourceAnchor )
				ifNil: [ 0 ]
				ifNotNil: [ :sourceText | sourceText startPos ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLGridLayout >> postImport [
	"try to dispose the elements by looking the addMethod position and the call of the met getNumberOfRow"

	| sortedAssociations |
	sortedAssociations := self sortedAssociations.
	sortedAssociations
		ifNotEmpty: [ | currentInvocation previousInvocations |
			currentInvocation := sortedAssociations first value.
			sortedAssociations first
				value: (self determineXandYfrom: currentInvocation andPrevious: nil).
			previousInvocations := currentInvocation.
			2 to: sortedAssociations size do: [ :index | 
				currentInvocation := (sortedAssociations at: index) value.
				(sortedAssociations at: index)
					value:
						(self
							determineXandYfrom: currentInvocation
							andPrevious: previousInvocations).
				previousInvocations := currentInvocation ] ].
	"add the attribute to the widgets"
	(self attributeAt: #cellAttribute ifAbsentPut: [ Dictionary new ])
		associations
		do: [ :assoc | 
			(self atPositionX: assoc value first Y: assoc value second)
				do: [ :widget | 
					(assoc key isKindOf: CSNLPosition)
						ifTrue: [ widget position: assoc key ]
						ifFalse: [ widget addAttribute: assoc key ] ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNLGridLayout >> sortedAssociations [
	^ {(self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		associations.
	(self attributeAt: #cellAttribute ifAbsentPut: [ Dictionary new ])
		associations} flatten
		sort: [ :assocWidgetArrayOrArrayValue1 :assocWidgetArrayOrArrayValue2 | 
			(self extractAddingPosition: assocWidgetArrayOrArrayValue1)
				< (self extractAddingPosition: assocWidgetArrayOrArrayValue2) ]
]
