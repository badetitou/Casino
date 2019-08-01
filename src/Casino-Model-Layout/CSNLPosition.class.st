Class {
	#name : #CSNLPosition,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLPosition class >> annotation [

	<MSEClass: #Position super: #MooseEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #meta }
CSNLPosition class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
CSNLPosition class >> requirements [

	<generated>
	^ { CSNWidget }
]

{ #category : #accessing }
CSNLPosition >> belongsTo [

	<generated>
	^ self widget

]

{ #category : #accessing }
CSNLPosition >> belongsTo: anObject [

	<generated>
	self widget: anObject

]

{ #category : #accessing }
CSNLPosition >> widget [

	<generated>
	<container>

	<MSEProperty: #widget type: #Object>
	^ self privateState attributeAt: #widget ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLPosition >> widget: anObject [

	<generated>
	(self privateState attributeAt: #widget ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self widget.
		self privateState attributeAt: #widget put: anObject.
		otherSide position: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #widget put: anObject.
		anObject position: self ]
]

{ #category : #navigation }
CSNLPosition >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
