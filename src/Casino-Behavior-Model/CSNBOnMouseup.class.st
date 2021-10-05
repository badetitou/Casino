"
Execute a JavaScript when releasing a mouse button over an element
"
Class {
	#name : #CSNBOnMouseup,
	#superclass : #CSNAction,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOnMouseup class >> annotation [

	<FMClass: #OnMouseup super: #CSNAction>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBOnMouseup class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'MouseUpHandler'
]

{ #category : #testing }
CSNBOnMouseup class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'mouseup';
		yourself
]
