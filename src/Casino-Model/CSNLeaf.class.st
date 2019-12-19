"
I reprensent a widget without sub-widget (like a paragraph, a text, a simple button, ...)
"
Class {
	#name : #CSNLeaf,
	#superclass : #CSNWidget,
	#instVars : [
		'#text => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNLeaf class >> annotation [

	<FMClass: #Leaf super: #CSNWidget>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNLeaf >> text [

	<FMProperty: #text type: #String>
	<generated>
	^ text
]

{ #category : #accessing }
CSNLeaf >> text: anObject [
	<generated>
	text := anObject
]
