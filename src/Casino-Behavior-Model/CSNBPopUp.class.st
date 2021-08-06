"
I represent a call which will create a pop up with the data as inside it (it corresponds most of the time to a String, but it can change)
"
Class {
	#name : #CSNBPopUp,
	#superclass : #CSNBEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBPopUp class >> annotation [

	<FMClass: #PopUp super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBPopUp >> data [
	"Relation named: #data type: #FASTTExpression opposite: #carrefourPopUpOwner"

	<generated>
	<FMComment: 'The data that will be displayed in the popUp'>
	<FMProperty: #data type: #FASTTExpression opposite: #carrefourPopUpOwner>
	^ self attributeAt: #data ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBPopUp >> data: anObject [

	<generated>
	(self attributeAt: #data ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self data.
		self attributeAt: #data put: anObject.
		otherSide carrefourPopUpOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #data put: anObject.
		anObject carrefourPopUpOwner: self ]
]

{ #category : #navigation }
CSNBPopUp >> dataGroup [
	<generated>
	<navigation: 'Data'>
	^ MooseSpecializedGroup with: self data
]
