"
A CSNLLayoutTest is a test class for testing the behavior of CSNLLayout
"
Class {
	#name : #CSNLLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'layout',
		'container1',
		'container2',
		'model'
	],
	#category : #'Casino-Model-Layout-Tests-Entities'
}

{ #category : #test }
CSNLLayoutTest >> setUp [

	super setUp.
	layout := CSNLLayout new.
	container1 := CSNContainer new.
	container2 := CSNContainer new.
	model := CSNLModel new.
	model addAll: { 
			layout.
			model.
			container1.
			container2 }.
	layout addWidget: container1.
	layout addWidget: container2
]

{ #category : #test }
CSNLLayoutTest >> testLayoutWidgets [

	self assert: layout layoutWidgets size equals: 2
]
