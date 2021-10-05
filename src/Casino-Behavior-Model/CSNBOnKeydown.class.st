"
Execute a JavaScript when a user is pressing a key
"
Class {
	#name : #CSNBOnKeydown,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnKeydown class >> annotation [

	<FMClass: #OnKeydown super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnKeydown class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'KeyDownHandler'
]

{ #category : #testing }
CSNBOnKeydown class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'keydown';
		yourself
]
