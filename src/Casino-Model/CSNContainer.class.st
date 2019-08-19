"
I'm a widget which can contain other widget (like a panel, a sub-""web page/window"", a composite button)
"
Class {
	#name : #CSNContainer,
	#superclass : #CSNWidget,
	#instVars : [
		'#widgets => FMMany type: #CSNWidget opposite: #widgetContainer'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNContainer class >> annotation [

	<MSEClass: #Container super: #CSNWidget>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNContainer >> addWidgets: anObject [
	<generated>
	^ self widgets add: anObject
]

{ #category : #accessing }
CSNContainer >> widgets [

	<generated>
	^ widgets
]

{ #category : #accessing }
CSNContainer >> widgets: anObject [

	<generated>
	widgets value: anObject

]

{ #category : #navigation }
CSNContainer >> widgetsGroup [
	<generated>
	<navigation: 'Widgets'>
	^ MooseGroup withAll: self widgets asSet
]
