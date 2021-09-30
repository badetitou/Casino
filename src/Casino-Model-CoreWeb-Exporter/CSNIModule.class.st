Class {
	#name : #CSNIModule,
	#superclass : #Object,
	#instVars : [
		'pages',
		'name'
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
