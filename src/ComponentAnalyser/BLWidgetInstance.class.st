"
I represent a widget a widget instance in the model
"
Class {
	#name : #BLWidgetInstance,
	#superclass : #Object,
	#instVars : [
		'link',
		'widgetClass',
		'constructor'
	],
	#category : 'ComponentAnalyser'
}

{ #category : #accessing }
BLWidgetInstance >> constructor [
	^ constructor
]

{ #category : #accessing }
BLWidgetInstance >> constructor: anObject [
	constructor := anObject
]

{ #category : #accessing }
BLWidgetInstance >> link [
	^ link
]

{ #category : #accessing }
BLWidgetInstance >> link: anObject [
	link := anObject
]

{ #category : #accessing }
BLWidgetInstance >> widgetClass [
	^ widgetClass
]

{ #category : #accessing }
BLWidgetInstance >> widgetClass: anObject [
	widgetClass := anObject
]
