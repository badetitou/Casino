Class {
	#name : #CSNStringTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-Importer-Java-Tests'
}

{ #category : #tests }
CSNStringTest >> testComplexeThing [
	| string |
	string := '("NIVEAU1LIST -> " + BLLabel.NIVEAU1LIST, BLLabel.NIVEAU1LIST)'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 2) equals: 'BLLabel.NIVEAU1LIST'
]

{ #category : #tests }
CSNStringTest >> testOneBooleanFalse [
	| string |
	string := 'setWidth(false)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'false'.

]

{ #category : #tests }
CSNStringTest >> testOneBooleanTrue [
	| string |
	string := 'setWidth(true)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'true'.

]

{ #category : #tests }
CSNStringTest >> testOneEmptyString [
	| string |
	string := 'setWidth("")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: ''.

]

{ #category : #tests }
CSNStringTest >> testOneEmptyStringWithScpace [
	| string |
	string := 'setWidth( "" )'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: ''.

]

{ #category : #tests }
CSNStringTest >> testOneNotEmptyString [
	| string |
	string := 'setWidth("Hello")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Hello'.
]

{ #category : #tests }
CSNStringTest >> testOneNumberAndOneStringNotEmpty [
	| string |
	string := 'setWidth(1,"Patate")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: '1'.
	self assert: (string extractParameters at: 2) equals: 'Patate'.

]

{ #category : #tests }
CSNStringTest >> testOneNumberParam [
	| string |
	string := 'setWidth(1)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: '1'.
]

{ #category : #tests }
CSNStringTest >> testProtectedString [
	| string |
	string := 'setWidth("Pat\"ate")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Pat\"ate'.

]

{ #category : #tests }
CSNStringTest >> testStringWithComma [
	| string |
	string := 'setWidth("Pat,ate")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Pat,ate'.

]

{ #category : #tests }
CSNStringTest >> testTwoEmptyString [
	| string |
	string := 'setWidth("","")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: ''.
	self assert: (string extractParameters at: 2) equals: ''.

]

{ #category : #tests }
CSNStringTest >> testTwoNotEmptyString [
	| string |
	string := 'setWidth("Hello","World")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: 'Hello'.
	self assert: (string extractParameters at: 2) equals: 'World'.
]

{ #category : #tests }
CSNStringTest >> testTwoNumbersParam [
	| string |
	string := 'setWidth(1,2)'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: '1'.
	self assert: (string extractParameters at: 2) equals: '2'.
]
