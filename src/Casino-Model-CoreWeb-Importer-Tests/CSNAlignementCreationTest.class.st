Class {
	#name : #CSNAlignementCreationTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #tests }
CSNAlignementCreationTest >> testCenter [
	| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: CSNLCenterAlignement.
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: nil
		andVertical: nil.
	self assert: createdElement equals: nil
]

{ #category : #tests }
CSNAlignementCreationTest >> testEast [
	| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: CSNLEastAlignement.
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: nil.
	self assert: createdElement class equals: CSNLEastAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testNorth [
	| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNLNorthAlignement.
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: nil
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNLNorthAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testNorthEast [
		| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNLNorthEastAlignement.
]

{ #category : #tests }
CSNAlignementCreationTest >> testNorthWest [
		| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_TOP'.
	self assert: createdElement class equals: CSNLNorthWestAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testSouth [
	| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_CENTER'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNLSouthAlignement.
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: nil
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNLSouthAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testSouthEast [
	| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_RIGHT'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNLSouthEastAlignement
]

{ #category : #tests }
CSNAlignementCreationTest >> testSouthWest [
		| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_BOTTOM'.
	self assert: createdElement class equals: CSNLSouthWestAlignement.
]

{ #category : #tests }
CSNAlignementCreationTest >> testWest [
	| createdElement |
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: 'HasVerticalAlignment.ALIGN_MIDDLE'.
	self assert: createdElement class equals: CSNLWestAlignement.
	createdElement := CSNLAlignement
		createAlignementWithHorizontal: 'HasHorizontalAlignment.ALIGN_LEFT'
		andVertical: nil.
	self assert: createdElement class equals: CSNLWestAlignement
]
