"
Event is fired when the mouse leave the DOM element
"
Class {
	#name : #CSNBOnOut,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnOut class >> annotation [

	<FMClass: #OnOut super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnOut class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'MouseOutHandler'
]

{ #category : #testing }
CSNBOnOut class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'mouseout';
		yourself
]
