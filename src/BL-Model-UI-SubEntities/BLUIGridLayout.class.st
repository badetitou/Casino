Class {
	#name : #BLUIGridLayout,
	#superclass : #BLLayout,
	#category : #'BL-Model-UI-SubEntities-Layout'
}

{ #category : #'as yet unclassified' }
BLUIGridLayout >> accept: anExporter [
	^ anExporter visitBLUIGridLayout: self
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> atLevel: level [
	^ (self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) select: [ :position | (position at: 1) = level ]
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> atLevelSorted: level [
	^ ((((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | (position at: 1) = level ]) associationsCollect: #yourself) sort: [ :a :b | a value last < b value last ])
		collect: #key
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> cellX: aXPosition Y: aYPosition horizontalSpan: span [
	^ (self privateState attributeAt: #cellHorizontalSpan ifAbsentPut: [ Dictionary new ])
		add:
			(self
				determineXandYfrom:
					{aXPosition.
					aYPosition}) -> span
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> cellX: aXPosition Y: aYPosition verticalSpan: span [
	^ (self privateState attributeAt: #cellVerticalSpan ifAbsentPut: [ Dictionary new ])
		add:
			(self
				determineXandYfrom:
					{aXPosition.
					aYPosition}) -> span
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineXandYfrom: theParametersAsAnArray [
	^ {((theParametersAsAnArray at: 1) asInteger
		ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			(theParametersAsAnArray at: 2) asInteger = 1
				ifTrue: [ self maxLevel ]
				ifFalse: [ self maxLevel + 1 ] ]).	"row"
	(theParametersAsAnArray at: 2) asInteger}	"column"
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> getVerticalSpanBeginningAtX: aXPosition [
	^ ((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | (position at: 1) = aXPosition ])
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> hasVerticalSpanBeginningAtX: aXPosition [
	^ ((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | (position at: 1) = aXPosition ]) isNotEmpty
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> maxLevel [
	^ ((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) collect: [ :coord | coord at: 1 ])
		ifEmpty: [ ^ 0 ]
		ifNotEmpty: [ :col | col max ]
]
