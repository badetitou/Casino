Class {
	#name : #CSNLSize,
	#superclass : #CSNOriginedEntity,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLSize class >> annotation [

	<FMClass: #Size super: #CSNOriginedEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #accessing }
CSNLSize >> widget [
	"Relation named: #widget type: #CSNWidget opposite: #size"

	<generated>
	<container>
	<derived>
	<FMProperty: #widget type: #CSNWidget opposite: #size>
	^ self privateState attributeAt: #widget ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLSize >> widget: anObject [

	<generated>
	(self privateState attributeAt: #widget ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self widget.
		self privateState attributeAt: #widget put: anObject.
		otherSide size: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #widget put: anObject.
		anObject size: self ]
]

{ #category : #navigation }
CSNLSize >> widgetGroup [
	<generated>
	<navigation: 'Widget'>
	^ MooseGroup with: self widget
]
