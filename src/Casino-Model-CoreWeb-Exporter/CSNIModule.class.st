Class {
	#name : #CSNIModule,
	#superclass : #Object,
	#instVars : [
		'pages',
		'name',
		'port'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLIdentity'
}

{ #category : #initialization }
CSNIModule >> initialize [
	super initialize.
	pages := OrderedCollection new
]

{ #category : #accessing }
CSNIModule >> name [

	^ name
]

{ #category : #accessing }
CSNIModule >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CSNIModule >> pages [

	^ pages
]

{ #category : #accessing }
CSNIModule >> pages: anObject [

	pages := anObject
]

{ #category : #accessing }
CSNIModule >> port [

	^ port ifNil: [ port := 4202 ]
]

{ #category : #accessing }
CSNIModule >> port: anObject [

	port := anObject
]
