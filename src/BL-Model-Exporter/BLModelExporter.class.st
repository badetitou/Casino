Class {
	#name : #BLModelExporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'root'
	],
	#category : 'BL-Model-Exporter'
}

{ #category : #actions }
BLModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
]

{ #category : #run }
BLModelExporter >> export [
	self prepareExport.
	self visit: model.
	self postExport 
]

{ #category : #accessing }
BLModelExporter >> model [
	^ model
]

{ #category : #accessing }
BLModelExporter >> model: anObject [
	model := anObject
]

{ #category : #run }
BLModelExporter >> postExport [
	"can do something here"
]

{ #category : #api }
BLModelExporter >> prepareExport [
	"can be override"
]

{ #category : #accessing }
BLModelExporter >> root [
	^ root
]

{ #category : #visiting }
BLModelExporter >> visit: anElement [
	anElement accept: self
]

{ #category : #visiting }
BLModelExporter >> visitBLOriginedEntity: anElement [
	anElement prepareAcceptFor: self.
	anElement writeCodeWith: self.
	anElement visitSuccessorWith: self 
]

{ #category : #visiting }
BLModelExporter >> visitBLPageMetier: aBLPageMetier [
	self visitBLOriginedEntity: aBLPageMetier 
]

{ #category : #visiting }
BLModelExporter >> visitBLPhase: aBLPhase [
	self visitBLOriginedEntity: aBLPhase 
]

{ #category : #visiting }
BLModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]
