Class {
	#name : #CSNJavaPossibleAddInvocationVisitor,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'invocation'
	],
	#category : #'Casino-Model-Importer-Java'
}

{ #category : #accessing }
CSNJavaPossibleAddInvocationVisitor >> invocation [

	^ invocation
]

{ #category : #accessing }
CSNJavaPossibleAddInvocationVisitor >> invocation: anObject [

	invocation := anObject
]

{ #category : #accessing }
CSNJavaPossibleAddInvocationVisitor >> is: anInvocation correctForWidget: aWidget [

	self invocation: anInvocation.
	^ self visit: aWidget
]

{ #category : #accessing }
CSNJavaPossibleAddInvocationVisitor >> visitCSNOriginedEntity: aCSNOriginedEntity [

	^ { 'setWidget('. 'setWidgets('. 'add('. 'setRecto('. 'setListe'.
	  'setWidgetDetail'. 'initWidget(' } anySatisfy: [ :keyword | 
		  (invocation signature beginsWith: keyword) and: [ invocation parameters isNotEmpty ] ]
]
