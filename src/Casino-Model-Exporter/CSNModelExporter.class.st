Class {
	#name : #CSNModelExporter,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'model',
		'context',
		'pluginExporters'
	],
	#category : #'Casino-Model-Exporter'
}

{ #category : #actions }
CSNModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
]

{ #category : #accessing }
CSNModelExporter >> addPluginExporters: aPluginExporter [

	pluginExporters add: aPluginExporter
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

{ #category : #initialization }
CSNModelExporter >> initialize [
	pluginExporters := OrderedCollection new
]

{ #category : #accessing }
CSNModelExporter >> model [
	^ model
]

{ #category : #accessing }
CSNModelExporter >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CSNModelExporter >> pluginExporters [

	^ pluginExporters
]

{ #category : #accessing }
CSNModelExporter >> pluginExporters: anObject [

	pluginExporters := anObject
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
