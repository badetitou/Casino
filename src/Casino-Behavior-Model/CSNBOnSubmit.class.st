"
Should happen when the submit event is fired (on a form)
"
Class {
	#name : #CSNBOnSubmit,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnSubmit class >> annotation [

	<FMClass: #OnSubmit super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNBOnSubmit class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'SubmitHandler'
]

{ #category : #meta }
CSNBOnSubmit class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'submit';
		yourself
]

{ #category : #'as yet unclassified' }
CSNBOnSubmit >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ "self warning: #ThisShouldBeFixed."
			'' ]
		ifNotEmpty: [ :behaviors | '(ngSubmit)="' , behaviors anyOne uniqueName , '()"' ]
]
