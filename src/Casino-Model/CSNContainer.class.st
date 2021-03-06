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

	<FMClass: #Container super: #CSNWidget>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNContainer >> widgets [
	"Relation named: #widgets type: #CSNWidget opposite: #widgetContainer"

	<generated>
	<derived>
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
	^ MooseSpecializedGroup withAll: self widgets asSet
]
