"
Execute a JavaScript when a user presses a key
"
Class {
	#name : #CSNBOnKeypress,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnKeypress class >> annotation [

	<FMClass: #OnKeypress super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnKeypress class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'KeyPressHandler'
]

{ #category : #testing }
CSNBOnKeypress class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'keypress';
		yourself
]
