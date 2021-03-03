Class {
	#name : #CSNLCell,
	#superclass : #CSNWidget,
	#instVars : [
		'#layoutOwner => FMOne type: #CSNLLayout opposite: #cell'
	],
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLCell class >> annotation [

	<FMClass: #Cell super: #CSNWidget>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #accessing }
CSNLCell >> layoutOwner [
	"Relation named: #layoutOwner type: #CSNLLayout opposite: #cell"

	<generated>
	<container>
	^ layoutOwner
]

{ #category : #accessing }
CSNLCell >> layoutOwner: anObject [

	<generated>
	layoutOwner := anObject
]

{ #category : #navigation }
CSNLCell >> layoutOwnerGroup [
	<generated>
	<navigation: 'LayoutOwner'>
	^ MooseSpecializedGroup with: self layoutOwner
]

{ #category : #accessing }
CSNLCell >> widget [
	"Relation named: #widget type: #CSNWidget opposite: #cellOwner"

	<generated>
	<FMProperty: #widget type: #CSNWidget opposite: #cellOwner>
	^ self attributeAt: #widget ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLCell >> widget: anObject [

	<generated>
	(self attributeAt: #widget ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self widget.
		self attributeAt: #widget put: anObject.
		otherSide cellOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #widget put: anObject.
		anObject cellOwner: self ]
]

{ #category : #navigation }
CSNLCell >> widgetGroup [
	<generated>
	<navigation: 'Widget'>
	^ MooseSpecializedGroup with: self widget
]
