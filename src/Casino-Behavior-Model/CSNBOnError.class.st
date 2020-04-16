"
Should happen when the error event is fired
"
Class {
	#name : #CSNBOnError,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnError class >> annotation [

	<FMClass: #OnError super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnError class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'ErrorHandler'
]

{ #category : #meta }
CSNBOnError class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'error';
		yourself
]

{ #category : #'as yet unclassified' }
CSNBOnError >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ "self warning: #ThisShouldBeFixed."
			'' ]
		ifNotEmpty: [ :behaviors | '(error)="' , behaviors anyOne uniqueName , '()"' ]
]
