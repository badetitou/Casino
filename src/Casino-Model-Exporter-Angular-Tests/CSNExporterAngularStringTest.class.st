Class {
	#name : #CSNExporterAngularStringTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-Exporter-Angular-Tests'
}

{ #category : #tests }
CSNExporterAngularStringTest >> testAsRealCamelCaseAlreadyCamelCase [
	self assert: 'HelloWorld' asRealCamelCase equals: 'HelloWorld'
]

{ #category : #tests }
CSNExporterAngularStringTest >> testAsRealCamelCaseDashed [
	self assert: 'hello-world' asRealCamelCase equals: 'HelloWorld'
]

{ #category : #tests }
CSNExporterAngularStringTest >> testAsRealCamelCaseMAJMAJ [
	self assert: 'HELLO WORLD' asRealCamelCase equals: 'HelloWorld'
]

{ #category : #tests }
CSNExporterAngularStringTest >> testAsRealCamelCaseSpaced [
	self assert: 'Hello World' asRealCamelCase equals: 'HelloWorld'
]

{ #category : #tests }
CSNExporterAngularStringTest >> testAsRealCamelCaseUnderline [
	self assert: 'Hello_World' asRealCamelCase equals: 'HelloWorld'
]
