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
	^ (self privateState attributeAt: #cellHorizontalSpan ifAbsentPut: [ Dictionary new ]) add: anInvocation -> anInvocation
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> at: anInvocation setVerticalSpan: span [
	^ (self privateState attributeAt: #cellVerticalSpan ifAbsentPut: [ Dictionary new ]) add: anInvocation -> anInvocation
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> atLevel: level [
	^ (self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) select: [ :position | position isArray and: [ (position first) = level ] ]
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> atLevelSorted: level [
	^ ((((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | (position at: 1) = level ]) associationsCollect: #yourself) sort: [ :a :b | a value second < b value second ])
		collect: #key
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineXFrom: anInvocation andPrevious: anPreviousInvocation [
	| aXValue |
	aXValue := anInvocation parameters first.
	^ aXValue asInteger
		ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			| currentXValue |
			"widget.setWidget(widget.getRowCount(), ..)"
			(aXValue includesSubstring: 'getRowCount')
				ifTrue: [ ^ self maxLevel + 1 ].
			"self halt."
			"determine current var value"
			currentXValue := (self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
				at: ((aXValue removePrefix: '++') removeSuffix: '++')
				ifAbsent: [ nil ].
			"If currentValue is not nil. It means we've already seen the variable. We can try to find the other usage of the variable to detect the potentiel var++ or ++var alone in the code.
			Else, we'll say it's the max level (but we do not have arguments)"
			currentXValue
				ifNotNil: [ (anInvocation from localVariables select: [ :localVariable | localVariable name = ((aXValue removePrefix: '++') removeSuffix: '++') ])
						ifNotEmpty: [ :localVariable | 
							| positions |
							positions := anInvocation from sourceAnchor findAllOccurrencesOfVariableNamed: localVariable first name.
							currentXValue := currentXValue  + (positions select: [ :val | val < anInvocation sourceAnchor startPos and: [ val > (anPreviousInvocation ifNil: [ 0 ] ifNotNil: [ anPreviousInvocation sourceAnchor endPos ]) ] ]) size.
							 ]
					 ]
				ifNil: [ currentXValue := self maxLevel ].
			"widget.setWidget(++var, ..)"
			(aXValue beginsWith: '++')
				ifTrue: [ currentXValue := currentXValue + 1.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: (aXValue removePrefix: '++') put: currentXValue ]
				ifFalse: [ "widget.setWidget(var++, ..)"
					(aXValue endsWith: '++')
						ifTrue: [ (self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: (aXValue removeSuffix: '++') put: currentXValue + 1 ]
						ifFalse: [ "widget.setWidget(var, ..)" (self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: aXValue put: currentXValue ] ].
			^ currentXValue ]
		ifNotNil: [ ^ aXValue asInteger ]
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineXandYfrom: anInvocation andPrevious: anPreviousInvocation [
	"add tmp variable understanding"

	^ {(self determineXFrom: anInvocation andPrevious: anPreviousInvocation).
	(self determineYFrom: anInvocation andPrevious: anPreviousInvocation)}
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> determineYFrom: anInvocation andPrevious: anPreviousInvocation [
	| aYValue |
	aYValue := anInvocation parameters second.
	^ aYValue asInteger
		ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			| yValue |
			(aYValue includesSubstring: 'getCellCount')
				ifTrue: [ ^ (self atLevel: aYValue parameters first asInteger) size ].
			(aYValue beginsWith: '++')
				ifTrue: [ yValue := self maxLevel + 1.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: (aYValue removePrefix: '++') put: yValue ].
			(aYValue endsWith: '++')
				ifTrue: [ yValue := self maxLevel.
					(self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: (aYValue removeSuffix: '++') put: yValue + 1 ].
			yValue
				ifNil: [ yValue := (self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: aYValue ifAbsentPut: [ 0 ].
					yValue = 0
						ifTrue: [ yValue := (self atLevel: self maxLevel) size ] ].
			yValue ifNil: [ yValue := (self atLevel: self maxLevel) size ].
			^ yValue ]
		ifNotNil: [ ^ aYValue asInteger ]
]

{ #category : #'as yet unclassified' }
BLUIGridLayout >> maxLevel [
	^ (((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) select: [ :element | element isArray ] thenCollect: [ :coord | coord first ]) select: [ :element | element isInteger ]) 
		ifEmpty: [ ^ 0 ]
		ifNotEmpty: [ :col | col max ]
]
