Class {
	#name : #CSNModelDependencyExporter,
	#superclass : #CSNBehaviorModelExporter,
	#instVars : [
		'context'
	],
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #'as yet unclassified' }
CSNModelDependencyExporter class >> export: behavior withContext: aContext [
	^ self new
		context: aContext;
		export: behavior
]

{ #category : #accessing }
CSNModelDependencyExporter >> context [
	^ context
]

{ #category : #accessing }
CSNModelDependencyExporter >> context: anObject [
	context := anObject
]
