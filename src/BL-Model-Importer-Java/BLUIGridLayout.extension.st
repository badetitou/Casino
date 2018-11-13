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
						-> (self determineXandYfrom: param).
							

			"alignement of the widget"
			aWidget
				position:
					(param size >= 4
						ifTrue: [ ((param at: 4) beginsWith: 'HasHorizontalAlignment.')
								ifTrue: [ BLAlignement
										createAlignementWithHorizontal: (param at: 4)
										andVertical: (param at: 5 ifAbsent: [ nil ]) ]
								ifFalse: [ BLAlignement
										createAlignementWithHorizontal: (param at: 5 ifAbsent: [ nil ])
										andVertical: (param at: 4) ] ]
						ifFalse: [ nil ]).
			cell add: tmpCell ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> getLayoutAttribute [
	^ {}
]
