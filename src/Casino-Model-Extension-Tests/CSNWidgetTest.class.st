"
A CSNWidgetTest is a test class for testing the behavior of CSNWidget
"
Class {
	#name : #CSNWidgetTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'container',
		'subContainer',
		'attribute',
		'subAttribute'
	],
	#category : #'Casino-Model-Extension-Tests'
}

{ #category : #test }
CSNWidgetTest >> setUp [
	super setUp.
	model := CSNModel new.
	container := CSNContainer new.
	container source: 2.
	subContainer := CSNContainer new.
	subContainer name: 'a sub container'.
	attribute := CSNAttribute new.
	container addAttribute: attribute.
	container addWidget: subContainer.
	subAttribute := CSNAttribute new.
	subContainer addAttribute: subAttribute.
	model addAll: { container. subContainer . attribute. subAttribute }
]

{ #category : #test }
CSNWidgetTest >> testAttributeAreCorrectlyGiven [
	self assert: (subContainer attributes includes: subAttribute).
	subContainer attributes do: [ :anAttribute | self assert: anAttribute widget equals: subContainer ]
]

{ #category : #test }
CSNWidgetTest >> testCopySubWidgets [

	| copy |
	copy := container verticalVeryDeepCopy.
	self assert: container widgets size equals: copy widgets size
]

{ #category : #test }
CSNWidgetTest >> testCopySubWidgetsHaveAttributes [

	| copy |
	copy := container verticalVeryDeepCopy.
	self assert: container widgets anyOne attributes size equals: 1
]

{ #category : #test }
CSNWidgetTest >> testVerticalVeryDeepCopy [

	self deny: subContainer equals: subContainer verticalVeryDeepCopy.
	self deny: subContainer verticalVeryDeepCopy widgetContainer equals: container.
	self assert: subContainer verticalVeryDeepCopy widgetContainer equals: nil.
]

{ #category : #test }
CSNWidgetTest >> testVerticalVeryDeepCopyHaveDifferentAttribute [
	| copy |
	copy := subContainer verticalVeryDeepCopy.
	self assert: subContainer attributes size equals: copy attributes size.
	subContainer attributes do: [ :anAttribute | self assert: anAttribute widget equals: subContainer ].
	copy attributes do: [ :anAttribute | self assert: anAttribute widget equals: copy ].
]

{ #category : #test }
CSNWidgetTest >> testVerticalVeryDeepCopyInSameMooseModel [

	self assert: subContainer mooseModel equals: subContainer verticalVeryDeepCopy mooseModel
]

{ #category : #test }
CSNWidgetTest >> testVerticalVeryDeepCopyName [

	self assert: subContainer realName equals: subContainer verticalVeryDeepCopy realName
]

{ #category : #test }
CSNWidgetTest >> testVerticalVeryDeepCopyTheSource [

	| copy |
	copy := container verticalVeryDeepCopy.
	self assert: container source equals: copy source.
]
