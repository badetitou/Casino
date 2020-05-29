"
When the user focus on an element
"
Class {
	#name : #CSNBOnFocus,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnFocus class >> annotation [

	<FMClass: #OnFocus super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnFocus class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'FocusHandler'
]

{ #category : #testing }
CSNBOnFocus class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'focus';
		yourself
]

{ #category : #'as yet unclassified' }
CSNBOnFocus >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(focus)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode) , '()"' ]
]
