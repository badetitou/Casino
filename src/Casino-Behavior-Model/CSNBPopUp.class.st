"
I represent a call which will create a pop up with the data as inside it (it corresponds most of the time to a String, but it can change)
"
Class {
	#name : #CSNBPopUp,
	#superclass : #FASTExpression,
	#instVars : [
		'data'
	],
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBPopUp class >> annotation [

	<MSEClass: #PopUp super: #FASTExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBPopUp class >> generatedSlotNames [
	<generated>
	'CSNBPopUp class>>#generatedSlotNames'.
	^ #(data)
]

{ #category : #generator }
CSNBPopUp class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBPopUp class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNBPopUp >> data [

	<MSEProperty: #data type: #FASTStatement>
	<generated>
	<MSEComment: 'The data that will be displayed in the popUp'>
	^ data
]

{ #category : #accessing }
CSNBPopUp >> data: anObject [

	<generated>
	data := anObject

]
