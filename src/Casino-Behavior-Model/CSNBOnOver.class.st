"
Event is fired when the mouse is over the dom element
"
Class {
	#name : #CSNBOnOver,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnOver class >> annotation [

	<FMClass: #OnOver super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNBOnOver class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'MouseOverHandler'
]

{ #category : #meta }
CSNBOnOver class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'mouseover';
		yourself
]
