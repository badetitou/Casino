"
Is fired when a page and all its components is loaded
"
Class {
	#name : #CSNBOnLoad,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnLoad class >> annotation [

	<FMClass: #OnLoad super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnLoad class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'LoadHandler'
]

{ #category : #testing }
CSNBOnLoad class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'load';
		yourself
]
