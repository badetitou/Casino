Class {
	#name : #BLAlignementCreationTest,
	#superclass : #TestCase,
	#category : #'BL-Model-CoreWeb-Importer-Tests'
}

{ #category : #tests }
BLAlignementCreationTest >> testCenter [
	| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: BLCenterAlignement.
	createdElement := BLAlignement
		createAlignementWithHorizontal: nil
		andVertical: nil.
	self assert: createdElement equals: nil
]

{ #category : #tests }
BLAlignementCreationTest >> testEast [
	| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: BLEastAlignement.
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: nil.
	self assert: createdElement class equals: BLEastAlignement
]

{ #category : #tests }
BLAlignementCreationTest >> testNorth [
	| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: BLNorthAlignement.
	createdElement := BLAlignement
		createAlignementWithHorizontal: nil
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: BLNorthAlignement
]

{ #category : #tests }
BLAlignementCreationTest >> testNorthEast [
		| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: BLNorthEastAlignement.
]

{ #category : #tests }
BLAlignementCreationTest >> testNorthWest [
		| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: BLNorthWestAlignement
]

{ #category : #tests }
BLAlignementCreationTest >> testSouth [
	| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: BLSouthAlignement.
	createdElement := BLAlignement
		createAlignementWithHorizontal: nil
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: BLSouthAlignement
]

{ #category : #tests }
BLAlignementCreationTest >> testSouthEast [
	| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: BLSouthEastAlignement
]

{ #category : #tests }
BLAlignementCreationTest >> testSouthWest [
		| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: BLSouthWestAlignement.
]

{ #category : #tests }
BLAlignementCreationTest >> testWest [
	| createdElement |
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: BLWestAlignement.
	createdElement := BLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: nil.
	self assert: createdElement class equals: BLWestAlignement
]
