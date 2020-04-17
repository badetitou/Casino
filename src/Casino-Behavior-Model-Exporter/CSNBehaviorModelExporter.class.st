Class {
	#name : #CSNBehaviorModelExporter,
	#superclass : #FASTJavaVisitor,
	#traits : 'TCSNBehaviorVisitor + TCSNExporter',
	#classTraits : 'TCSNBehaviorVisitor classTrait + TCSNExporter classTrait',
	#instVars : [
		'errorStream',
		'showUnknowExport',
		'debugMode'
	],
	#category : #'Casino-Behavior-Model-Exporter'
}

{ #category : #actions }
CSNBehaviorModelExporter class >> export: aBehaviorModel [
	^ self new export: aBehaviorModel
]

{ #category : #actions }
CSNBehaviorModelExporter class >> export: aBehaviorModel on: aStream [
	^ (self on: aStream) export: aBehaviorModel
]

{ #category : #actions }
CSNBehaviorModelExporter class >> export: aBehaviorModel on: aStream withIndentLevel: anIndentLevel [
	^ (self on: aStream)
		indentLevel: anIndentLevel;
		export: aBehaviorModel
]

{ #category : #accessing }
CSNBehaviorModelExporter >> debugMode [
	^ debugMode
]

{ #category : #accessing }
CSNBehaviorModelExporter >> debugMode: anObject [
	debugMode := anObject
]

{ #category : #accessing }
CSNBehaviorModelExporter >> errorStream [
	^ errorStream
]

{ #category : #accessing }
CSNBehaviorModelExporter >> errorStream: anObject [
	errorStream := anObject
]

{ #category : #api }
CSNBehaviorModelExporter >> export: aBehaviorMethod [
	[ self showUnknowExport ifTrue: [ self errorStream: (WriteStream with: String new) ].
	self accept: aBehaviorMethod ]
		ensure: [ self errorStream
				flush;
				close ]
]

{ #category : #streaming }
CSNBehaviorModelExporter >> initialize [
	super initialize.
	errorStream := WriteStream with: String new.
	showUnknowExport := true.
	debugMode := true
]

{ #category : #accessing }
CSNBehaviorModelExporter >> showUnknowExport [
	^ showUnknowExport
]

{ #category : #accessing }
CSNBehaviorModelExporter >> showUnknowExport: anObject [
	showUnknowExport := anObject
]
