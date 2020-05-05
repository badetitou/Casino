"
Should happen when the change event is fired
"
Class {
	#name : #CSNBOnChange,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnChange class >> annotation [

	<FMClass: #OnChange super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNBOnChange class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'ChangeHandler'
]

{ #category : #meta }
CSNBOnChange class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'change';
		yourself
]

{ #category : #'as yet unclassified' }
CSNBOnChange >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(change)="' , (behaviors anyOne uniqueNameInPage: self caller rootNode), '()"' ]
]
