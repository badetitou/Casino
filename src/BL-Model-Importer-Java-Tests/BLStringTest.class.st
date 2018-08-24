Class {
	#name : #BLStringTest,
	#superclass : #TestCase,
	#category : #'BL-Model-Importer-Java-Tests'
}

{ #category : #tests }
BLStringTest >> testOneBooleanFalse [
	| string |
	string := 'setWidth(false)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'false'.

]

{ #category : #tests }
BLStringTest >> testOneBooleanTrue [
	| string |
	string := 'setWidth(true)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'true'.

]

{ #category : #tests }
BLStringTest >> testOneEmptyString [
	| string |
	string := 'setWidth("")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: ''.

]

{ #category : #tests }
BLStringTest >> testOneEmptyStringWithScpace [
	| string |
	string := 'setWidth( "" )'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: ''.

]

{ #category : #tests }
BLStringTest >> testOneNotEmptyString [
	| string |
	string := 'setWidth("Hello")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Hello'.
]

{ #category : #tests }
BLStringTest >> testOneNumberAndOneStringNotEmpty [
	| string |
	string := 'setWidth(1,"Patate")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: '1'.
	self assert: (string extractParameters at: 2) equals: 'Patate'.

]

{ #category : #tests }
BLStringTest >> testOneNumberParam [
	| string |
	string := 'setWidth(1)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: '1'.
]

{ #category : #tests }
BLStringTest >> testProtectedString [
	| string |
	string := 'setWidth("Pat\"ate")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Pat\"ate'.

]

{ #category : #tests }
BLStringTest >> testTwoEmptyString [
	| string |
	string := 'setWidth("","")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: ''.
	self assert: (string extractParameters at: 2) equals: ''.

]

{ #category : #tests }
BLStringTest >> testTwoNotEmptyString [
	| string |
	string := 'setWidth("Hello","World")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: 'Hello'.
	self assert: (string extractParameters at: 2) equals: 'World'.
]

{ #category : #tests }
BLStringTest >> testTwoNumbersParam [
	| string |
	string := 'setWidth(1,2)'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: '1'.
	self assert: (string extractParameters at: 2) equals: '2'.
]
