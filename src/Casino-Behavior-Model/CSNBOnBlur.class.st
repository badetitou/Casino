"
Event is fired when a dom element lose the focus
"
Class {
	#name : #CSNBOnBlur,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnBlur class >> annotation [

	<FMClass: #OnBlur super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnBlur class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'BlurHandler'
]

{ #category : #testing }
CSNBOnBlur class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'blur';
		yourself
]
