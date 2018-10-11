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
BLUIGridLayout >> maxLevel [
	^ ((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) collect: [ :coord | coord at: 1 ])
		ifEmpty: [ ^ 0 ]
		ifNotEmpty: [ :col | col max ]
]
