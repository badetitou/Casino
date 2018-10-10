Class {
	#name : #BLUIGridLayout,
	#superclass : #BLLayout,
	#category : #'BL-Model-UI-SubEntities-Layout'
}

{ #category : #adding }
BLUIGridLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	| param tmpCell|
	param := anInvocation parameters.
	tmpCell := (BLCell new addWidget: aWidget; yourself).
	(self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		add:
			tmpCell ->
					{(param at: 1) asInteger ifNil: [0].
					(param at: 2) asInteger}.
	cell add: tmpCell
]
