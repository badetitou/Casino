Class {
	#name : #CSNModelCanHandleGetAttributeCoreWebVisitor,
	#superclass : #CSNModelBehaviorImporterVisitor,
	#category : #'Casino-Behavior-Model-Importer-Java-Visitor'
}

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNAttribute: aCSNAttribute [
	<generated>
	^ false
]

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNUILabel: aCSNUILabel [
	<generated>
	^ source signature beginsWith: 'getText'
]
