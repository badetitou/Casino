Class {
	#name : #CSNModelCanHandleGetAttributeCoreWebVisitor,
	#superclass : #CSNModelImporterVisitor,
	#category : #'Casino-Model-CoreWeb-Importer-Visitor'
}

{ #category : #private }
CSNModelCanHandleGetAttributeCoreWebVisitor >> canBeCSNUIHeight [
	^ source isInvocation and: [ source signature beginsWith: 'setHeight' ]
]

{ #category : #private }
CSNModelCanHandleGetAttributeCoreWebVisitor >> canBeCSNUIWidth [
	^ source isInvocation and: [ source signature beginsWith: 'setWidth' ]
]

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters first
]

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNAttribute: aCSNAttribute [
	<generated>
	^ false
]

{ #category : #api }
CSNModelCanHandleGetAttributeCoreWebVisitor >> visitCSNUIVisibility: aCSNUIVisibility [
	^ source isInvocation and: [ source signature beginsWith: 'getVisible' ]
]
