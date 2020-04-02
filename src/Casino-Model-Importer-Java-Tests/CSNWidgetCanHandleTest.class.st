Class {
	#name : #CSNWidgetCanHandleTest,
	#superclass : #TestCase,
	#instVars : [
		'c',
		'm',
		'i'
	],
	#category : #'Casino-Model-Importer-Java-Tests'
}

{ #category : #testing }
CSNWidgetCanHandleTest class >> isAbstract [
	^ self name = #CSNWidgetCanHandleTest
]

{ #category : #running }
CSNWidgetCanHandleTest >> generatedModelClass [
	"Change if specific widget exist"
	^ self subclassResponsibility
]

{ #category : #running }
CSNWidgetCanHandleTest >> javaClassName [
	^ self subclassResponsibility 
]

{ #category : #running }
CSNWidgetCanHandleTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	c := FAMIXClass new name: self javaClassName.
	m := FAMIXMethod new.
	c addMethod: m.
	i := FAMIXInvocation new.
	i signature: #'()'.
	i addCandidate: m
]

{ #category : #tests }
CSNWidgetCanHandleTest >> testCanHandle [
	self assert: self generatedModelClass equals: (CSNWidget newFor: i) class
]
