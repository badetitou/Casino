"
Execute when a keypress is finished.
"
Class {
	#name : #CSNBOnKeyup,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnKeyup class >> annotation [

	<FMClass: #OnKeyup super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnKeyup class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'KeyUpHandler'
]

{ #category : #testing }
CSNBOnKeyup class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'keyup';
		yourself
]
