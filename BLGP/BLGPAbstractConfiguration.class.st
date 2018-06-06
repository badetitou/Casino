Class {
	#name : #BLGPAbstractConfiguration,
	#superclass : #GPConfiguration,
	#category : 'BLGP'
}

{ #category : #accessing }
BLGPAbstractConfiguration >> alpha [
	^ 0
]

{ #category : #accessing }
BLGPAbstractConfiguration >> beta [
	^ 2
]

{ #category : #operations }
BLGPAbstractConfiguration >> createNewIndividual [
	| trace |
	trace := self newFunction.
	trace addChild: self newTerminal.
	trace addChild: self newTerminal.
	trace addChild: self newTerminal.
	trace addChild: self newTerminal.
	^trace 
]

{ #category : #operations }
BLGPAbstractConfiguration >> distanceBetween: model1 and: model2 [
	model1 = model2
		ifTrue: [ ^ self alpha ].
		^ self gamma
]

{ #category : #operations }
BLGPAbstractConfiguration >> distanceFromSolutionOf: individual [
	"Probably error * gamma, partial * beta, good * alpha"

	| result distance |
	distance := 0.
	result := self exampleDataSource collect: [ :source | individual evaluateUsing: source ].
	1 to: self exampleDataSource size do: [ :idx | 
		distance := distance
			+ (self distanceBetween: (result at: idx) and: (self exampleDataTarget at: idx)) ].
	^ distance
]

{ #category : #example }
BLGPAbstractConfiguration >> example [
	"
	self new example print
	"

	| e |
	e := GPEngine new.
	e configuration: BLGPAbstractConfiguration  new.
	e execute.
	^ e pickBestIndividual
]

{ #category : #example }
BLGPAbstractConfiguration >> exampleDataSource [
	| m1 m2 m3 |
m1 := MooseModel new.
	m2 := MooseModel new.
	m3 := MooseModel new.
	m1 add: (FAMIXClass new name: 'data1').
	m2 add: (FAMIXClass new name: 'data2').
	m3 add: (FAMIXClass new name: 'data3').
	^ {m1.
	m2.
	m3} asOrderedCollection
]

{ #category : #example }
BLGPAbstractConfiguration >> exampleDataTarget [
| m1 m2 m3 |
	m1 := MooseModel new.
	m2 := MooseModel new.
	m3 := MooseModel new.
	m1 add: (FAMIXClass new name: 'data1').
	m2 add: (FAMIXClass new name: 'data2').
	m3 add: (FAMIXClass new name: 'data3').
	^ {m1.
	m2.
	m3} asOrderedCollection
]

{ #category : #accessing }
BLGPAbstractConfiguration >> gamma [
	^ 8
]

{ #category : #hooks }
BLGPAbstractConfiguration >> newFunction [
	"This method has to return a Rule from all the possible rules"

	^ BLTrace new.
]

{ #category : #hooks }
BLGPAbstractConfiguration >> newTerminal [
	^ (BLRule subclasses at: (self randomElementOf: (1 to: BLRule subclasses size))) new
]

{ #category : #hooks }
BLGPAbstractConfiguration >> numberOfGenerations [
	" number from paper Multi-step learning and adaptive search for learning complex model transformations from examples "

	^ 10
]

{ #category : #accessing }
BLGPAbstractConfiguration >> populationSize [
	" number from paper Multi-step learning and adaptive search for learning complex model transformations from examples " 

	^ 100
]
