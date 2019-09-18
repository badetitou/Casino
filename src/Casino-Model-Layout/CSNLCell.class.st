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

	<MSEClass: #Cell super: #CSNWidget>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #meta }
CSNLCell class >> requirements [

	<generated>
	^ { CSNLLayout }
]

{ #category : #accessing }
CSNLCell >> belongsTo [

	<generated>
	^ self layoutOwner

]

{ #category : #accessing }
CSNLCell >> belongsTo: anObject [

	<generated>
	self layoutOwner: anObject

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
	^ MooseGroup with: self layoutOwner
]

{ #category : #accessing }
CSNLCell >> widget [
	"Relation named: #widget type: #CSNLWidget opposite: #cellOwner"

	<generated>
	<MSEProperty: #widget type: #Object>
	^ self privateState attributeAt: #widget ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLCell >> widget: anObject [

	<generated>
	(self privateState attributeAt: #widget ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self widget.
		self privateState attributeAt: #widget put: anObject.
		otherSide cellOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #widget put: anObject.
		anObject cellOwner: self ]
]

{ #category : #navigation }
CSNLCell >> widgetGroup [
	<generated>
	<navigation: 'Widget'>
	^ MooseGroup with: self widget
]
