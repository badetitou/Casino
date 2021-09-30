Class {
	#name : #CSNModelExporter,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'model',
		'context'
	],
	#category : #'Casino-Model-Exporter'
}

{ #category : #actions }
CSNModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
]

{ #category : #accessing }
CSNModelExporter >> context [
	^ context
]

{ #category : #accessing }
CSNModelExporter >> context: anObject [

	context := anObject
]

{ #category : #run }
CSNModelExporter >> export [
	self prepareExport.
	self runExport.
	self postExport 
]

{ #category : #accessing }
CSNModelExporter >> model [
	^ model
]

{ #category : #accessing }
CSNModelExporter >> model: anObject [
	model := anObject
]

{ #category : #run }
CSNModelExporter >> postExport [
	"can do something here"
]

{ #category : #run }
CSNModelExporter >> prepareExport [
	"can be override"
]

{ #category : #accessing }
CSNModelExporter >> root [
	^ self context root
]

{ #category : #run }
CSNModelExporter >> runExport [
	self visit: model. 
]

{ #category : #visiting }
CSNModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]
