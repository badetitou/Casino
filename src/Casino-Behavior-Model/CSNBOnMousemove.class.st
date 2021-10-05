"
Execute a JavaScript when releasing a mouse move over an element
"
Class {
	#name : #CSNBOnMousemove,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnMousemove class >> annotation [

	<FMClass: #OnMousemove super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnMousemove class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'MouseMoveHandler'
]

{ #category : #testing }
CSNBOnMousemove class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'mousemove';
		yourself
]
