Class {
	#name : #CSNIdentityConfiguration,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#category : #'Casino-Model-CoreWeb-Exporter'
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
		xmlModule descendantElementsNamed: #phase do: [ :xmlPhase | 
			aCSNModel allCSNPage
				detect: [ :csnPage | 
				csnPage codePhase = (xmlPhase attributeAt: #codePhase) ]
				ifOne: [ :page | configModule pages add: page ] ].
		instance modules add: configModule ].
	^ instance
]

{ #category : #initialization }
CSNIdentityConfiguration >> initialize [
	super initialize.
	modules := OrderedCollection new
]

{ #category : #accessing }
CSNIdentityConfiguration >> moduleOfPage: aCSNPage [

	^ self modules
		  detect: [ :aModule | 
		  aModule pages anySatisfy: [ :page | page = aCSNPage ] ]
		  ifNone: [ nil ]
]

{ #category : #accessing }
CSNIdentityConfiguration >> modules [

	^ modules
]

{ #category : #accessing }
CSNIdentityConfiguration >> modules: anObject [

	modules := anObject
]
