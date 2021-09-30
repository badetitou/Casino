Class {
	#name : #CSNIdentityConfiguration,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLIdentity'
}

{ #category : #'instance creation' }
CSNIdentityConfiguration class >> fromXML: anXMLFile andModel: aCSNModel [

	"I create an Identity COnfiguration based on a xml file and a CSNModel"

	| instance |
	instance := self new.
	(anXMLFile descendantElementsNamed: #module) do: [ :xmlModule | 
		| configModule |
		configModule := CSNIModule new
			                name: (xmlModule attributeAt: #name);
			                yourself.
		xmlModule
			descendantElementsNamed: #phase
			do: [ :xmlPhase | configModule pages add: (aCSNModel allCSNPage detect: [ :csnPage | csnPage codePhase = (xmlPhase attributeAt: #codePhase) ]) ].
		instance modules add: configModule ].
	^ instance
]

{ #category : #initialization }
CSNIdentityConfiguration >> initialize [
	super initialize.
	modules := OrderedCollection new
]

{ #category : #accessing }
CSNIdentityConfiguration >> modules [

	^ modules
]

{ #category : #accessing }
CSNIdentityConfiguration >> modules: anObject [

	modules := anObject
]
