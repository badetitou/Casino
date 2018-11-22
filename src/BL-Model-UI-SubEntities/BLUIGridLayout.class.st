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
BLUIGridLayout >> at: anInvocation setHorizontalSpan: span [
	^ (self privateState attributeAt: #cellHorizontalSpan ifAbsentPut: [ Dictionary new ]) add: anInvocation -> anInvocation parameters
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> at: anInvocation setVerticalSpan: span [
	^ (self privateState attributeAt: #cellVerticalSpan ifAbsentPut: [ Dictionary new ]) add: anInvocation -> anInvocation parameters
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> atLevel: level [
	^ (self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) select: [ :position | (position at: 1) = level ]
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> atLevelSorted: level [
	^ ((((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | (position at: 1) = level ]) associationsCollect: #yourself) sort: [ :a :b | a value second < b value second ])
		collect: #key
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineXFrom: aXValue [	
	^ (aXValue asInteger
		ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			| xValue |
			(aXValue includesSubstring: 'getRowCount')
				ifTrue: [ xValue := self maxLevel + 1 ].
			(aXValue beginsWith: '++')
				ifTrue: [ xValue := self maxLevel + 1.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
						at: (aXValue removePrefix: '++')
						put: xValue ].
			(aXValue endsWith: '++')
				ifTrue: [ xValue := self maxLevel.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
						at: (aXValue removeSuffix: '++')
						put: xValue + 1 ].
			xValue
				ifNil: [ xValue := (self privateState
						attributeAt: #addGridVariable
						ifAbsentPut: [ Dictionary new ])
						at: aXValue
						ifAbsentPut: [ 0 ].
					xValue = 0
						ifTrue: [ xValue := self maxLevel ] ].
			xValue ifNil: [ xValue := self maxLevel ].
			^ xValue ]
		ifNotNil: [ ^ aXValue asInteger ])
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineXandYfrom: theParametersAsAnArray [
	"add tmp variable understanding"

	^ {theParametersAsAnArray at: 1 put: (self determineXFrom: (theParametersAsAnArray at: 1)). theParametersAsAnArray at: 2 put: (self determineYFrom: (theParametersAsAnArray at: 2))}.
	
	"{((theParametersAsAnArray at: 1) asInteger
		ifNil: [ ""in case of setWidget(row,0).. Then setWidget(row++,1)""
			| xValue |
			((theParametersAsAnArray at: 1) includesSubstring: 'getRowCount')
				ifTrue: [ xValue := self maxLevel + 1 ].
			((theParametersAsAnArray at: 1) beginsWith: '++')
				ifTrue: [ xValue := self maxLevel + 1.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
						at: ((theParametersAsAnArray at: 1) removePrefix: '++')
						put: xValue ].
			((theParametersAsAnArray at: 1) endsWith: '++')
				ifTrue: [ xValue := self maxLevel.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
						at: ((theParametersAsAnArray at: 1) removeSuffix: '++')
						put: xValue + 1 ].
			xValue
				ifNil: [ xValue := (self privateState
						attributeAt: #addGridVariable
						ifAbsentPut: [ Dictionary new ])
						at: (theParametersAsAnArray at: 1)
						ifAbsentPut: [ 0 ].
					xValue = 0
						ifTrue: [ xValue := self maxLevel ] ].
			xValue ifNil: [ xValue := self maxLevel ].
			theParametersAsAnArray at: 1 put: xValue ]
		ifNotNil: [ theParametersAsAnArray at: 1 put: (theParametersAsAnArray at: 1) asInteger ]).	
	(theParametersAsAnArray at: 2 put: ((theParametersAsAnArray at: 2) asInteger ifNil: [0]))}	"
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineYFrom: aYValue [	
	^ (aYValue asInteger
		ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			| yValue |
			(aYValue includesSubstring: 'getCellCount')
				ifTrue: [ yValue := (self atLevel: aYValue parameters first asInteger) size ].
			(aYValue beginsWith: '++')
				ifTrue: [ yValue := self maxLevel + 1.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
						at: (aYValue removePrefix: '++')
						put: yValue ].
			(aYValue endsWith: '++')
				ifTrue: [ yValue := self maxLevel.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
						at: (aYValue removeSuffix: '++')
						put: yValue + 1 ].
			yValue
				ifNil: [ yValue := (self privateState
						attributeAt: #addGridVariable
						ifAbsentPut: [ Dictionary new ])
						at: aYValue
						ifAbsentPut: [ 0 ].
					yValue = 0
						ifTrue: [ yValue := (self atLevel: self maxLevel) size ] ].
			yValue ifNil: [ yValue := (self atLevel: self maxLevel) size ].
			^ yValue ]
		ifNotNil: [ ^ aYValue asInteger ])
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> maxLevel [
	^ ((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) collect: [ :coord | coord at: 1 ] thenSelect: [ :element | element isInteger ]) 
		ifEmpty: [ ^ 0 ]
		ifNotEmpty: [ :col | col max ]
]
