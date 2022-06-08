Class {
	#name : #CSNJavaArgumentsFromInvocationOfWidget,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'invocation'
	],
	#category : #'Casino-Model-Importer-Java'
}

{ #category : #'as yet unclassified' }
CSNJavaArgumentsFromInvocationOfWidget class >> argumentFrom: aFamixJavaInvocation for: aWidget [

	^ self new
		  invocation: aFamixJavaInvocation;
		  visit: aWidget
]

{ #category : #'as yet unclassified' }
CSNJavaArgumentsFromInvocationOfWidget >> invocation: anObject [

	invocation := anObject
]

{ #category : #'as yet unclassified' }
CSNJavaArgumentsFromInvocationOfWidget >> visitCSNOriginedEntity: aCSNOriginedEntity [

	^ (invocation signature beginsWith: 'setWidgets')
		  ifTrue: [ invocation fast arguments ]
		  ifFalse: [ { invocation fast arguments first } ]
]

{ #category : #'as yet unclassified' }
CSNJavaArgumentsFromInvocationOfWidget >> visitCSNUIPanel: aCSNUIPanel [

	^ invocation fast arguments size >= 3
		  ifTrue: [ { invocation fast arguments third } ]
		  ifFalse: [ super visitCSNUIPanel: aCSNUIPanel ]
]
