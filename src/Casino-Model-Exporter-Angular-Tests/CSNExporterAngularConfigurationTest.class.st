"
A CSNExporterAngularConfigurationTest is a test class for testing the behavior of CSNExporterAngularConfiguration
"
Class {
	#name : #CSNExporterAngularConfigurationTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-Exporter-Angular-Tests'
}

{ #category : #test }
CSNExporterAngularConfigurationTest >> testAngularRepresentationOf [
	| representation |
	representation := CSNExporterAngularConfiguration new
		angularRepresentationOf: CSNWidget new.
	self assert: representation class equals: WidgetRepresentation
]

{ #category : #test }
CSNExporterAngularConfigurationTest >> testAngularRepresentationOfDefineElement [
	| representation configuration |
	configuration := CSNExporterAngularConfiguration new.
	configuration at: CSNUIButton put: MCButton new.
	representation := configuration
		angularRepresentationOf: CSNUIButton new.
	self assert: representation class equals: MCButton
]

{ #category : #test }
CSNExporterAngularConfigurationTest >> testAngularRepresentationOfDefineElementSubclass [
	| representation configuration |
	configuration := CSNExporterAngularConfiguration new.
	configuration at: CSNUIInput put: MCInput new.
	representation := configuration
		angularRepresentationOf: CSNUIInputFile new.
	self assert: representation class equals: MCInput
]

{ #category : #test }
CSNExporterAngularConfigurationTest >> testAngularRepresentationOfUnknowClass [
	| representation |
	representation := CSNExporterAngularConfiguration new
		angularRepresentationOf: CSNContainer new.
	self assert: representation class equals: WidgetRepresentation
]
