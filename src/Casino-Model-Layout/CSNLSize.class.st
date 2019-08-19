Class {
	#name : #CSNLSize,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLSize class >> annotation [

	<MSEClass: #Size super: #MooseEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #meta }
CSNLSize class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
CSNLSize class >> requirements [

	<generated>
	^ { CSNWidget }
]

{ #category : #accessing }
CSNLSize >> belongsTo [

	<generated>
	^ self widget

]

{ #category : #accessing }
CSNLSize >> belongsTo: anObject [

	<generated>
	self widget: anObject

]

{ #category : #accessing }
CSNLSize >> widget [

	<generated>
	<container>

	<MSEProperty: #widget type: #Object>
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
