"
I represent a call which will create a dialog with the data as inside it (it corresponds most of the time to a String, but it can change)
"
Class {
	#name : #CSNBOpenDialog,
	#superclass : #CSNBEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBOpenDialog class >> annotation [

	<FMClass: #OpenDialog super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBOpenDialog >> dialog [
	"Relation named: #dialog type: #CSNUICWDialog opposite: #opener"

	<generated>
	<FMProperty: #dialog type: #CSNUICWDialog opposite: #opener>
	^ self attributeAt: #dialog ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBOpenDialog >> dialog: anObject [

	<generated>
	self attributeAt: #dialog put: (FMMultivalueLink on: self update: #opener from: self dialog to: anObject).
]
