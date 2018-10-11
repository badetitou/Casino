Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-Importer-Java' }
BLUIGridLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	| tmpCell|
	anInvocation ifNil: [ super addWidget: aWidget withInvocationOfAdd: anInvocation ] ifNotNil: [ :invoc | | param |
		param := invoc parameters.
	tmpCell := (BLCell new addWidget: aWidget; yourself).
	(self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		add:
			tmpCell ->
					{(param at: 1) asInteger ifNil: [0]. "row"
					(param at: 2) asInteger}. "column"
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
