Class {
	#name : #CSNLPosition,
	#superclass : #CSNOriginedEntity,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLPosition class >> annotation [

	<FMClass: #Position super: #CSNOriginedEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #accessing }
CSNLPosition >> widget [
	"Relation named: #widget type: #CSNWidget opposite: #position"

	<generated>
	<container>
	<derived>
	<FMProperty: #widget type: #CSNWidget opposite: #position>
	^ self attributeAt: #widget ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLPosition >> widget: anObject [

	<generated>
	(self attributeAt: #widget ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self widget.
		self attributeAt: #widget put: anObject.
		otherSide position: nil ]
	ifNotNil: [ 
		self attributeAt: #widget put: anObject.
		anObject position: self ]
]

{ #category : #navigation }
CSNLPosition >> widgetGroup [
	<generated>
	<navigation: 'Widget'>
	^ MooseSpecializedGroup with: self widget
]
