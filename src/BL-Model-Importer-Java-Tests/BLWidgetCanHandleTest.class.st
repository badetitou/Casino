Class {
	#name : #BLWidgetCanHandleTest,
	#superclass : #TestCase,
	#instVars : [
		'c',
		'm',
		'i'
	],
	#category : #'BL-Model-Importer-Java-Tests'
}

{ #category : #testing }
BLWidgetCanHandleTest class >> isAbstract [
	^ self name = #BLWidgetCanHandleTest
]

{ #category : #running }
BLWidgetCanHandleTest >> generatedModelClass [
	"Change if specific widget exist"
	^ self subclassResponsibility
]

{ #category : #running }
BLWidgetCanHandleTest >> javaClassName [
	^ self subclassResponsibility 
]

{ #category : #running }
BLWidgetCanHandleTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	c := FAMIXClass new name: self javaClassName.
	m := FAMIXMethod new.
	c addMethod: m.
	i := FAMIXInvocation new.
	i signature: #'()'.
	i addCandidate: m
]

{ #category : #running }
BLWidgetCanHandleTest >> testCanHandle [
	self assert: self generatedModelClass equals: (BLWidget newFor: i) class
]
