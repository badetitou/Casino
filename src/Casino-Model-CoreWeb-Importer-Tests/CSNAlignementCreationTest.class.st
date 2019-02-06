Class {
	#name : #CSNAlignementCreationTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #tests }
CSNAlignementCreationTest >> testCenter [
	| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: CSNCenterAlignement.
	createdElement := CSNAlignement
		createAlignementWithHorizontal: nil
		andVertical: nil.
	self assert: createdElement equals: nil
]

{ #category : #tests }
CSNAlignementCreationTest >> testEast [
	| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: CSNEastAlignement.
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: nil.
	self assert: createdElement class equals: CSNEastAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testNorth [
	| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNNorthAlignement.
	createdElement := CSNAlignement
		createAlignementWithHorizontal: nil
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNNorthAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testNorthEast [
		| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNNorthEastAlignement.
]

{ #category : #tests }
CSNAlignementCreationTest >> testNorthWest [
		| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNNorthWestAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testSouth [
	| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNSouthAlignement.
	createdElement := CSNAlignement
		createAlignementWithHorizontal: nil
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNSouthAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testSouthEast [
	| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNSouthEastAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testSouthWest [
		| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNSouthWestAlignement.
]

{ #category : #tests }
CSNAlignementCreationTest >> testWest [
	| createdElement |
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: CSNWestAlignement.
	createdElement := CSNAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: nil.
	self assert: createdElement class equals: CSNWestAlignement
]
