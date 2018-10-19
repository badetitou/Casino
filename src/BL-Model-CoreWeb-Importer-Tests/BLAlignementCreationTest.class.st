Class {
	#name : #BLAlignementCreationTest,
	#superclass : #TestCase,
	#category : #'BL-Model-CoreWeb-Importer-Tests'
}

{ #category : #tests }
BLAlignementCreationTest >> testCenter [
	self error
]

{ #category : #tests }
BLAlignementCreationTest >> testEast [
	self error
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
	self error
]

{ #category : #tests }
BLAlignementCreationTest >> testNorthWest [
	self error
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
	self error
]

{ #category : #tests }
BLAlignementCreationTest >> testSouthWest [
	self error
]

{ #category : #tests }
BLAlignementCreationTest >> testWest [
	self error.
]
