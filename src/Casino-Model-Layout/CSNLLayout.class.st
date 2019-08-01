Class {
	#name : #CSNLLayout,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#cell => FMMany type: #CSNLCell opposite: #layoutOwner'
	],
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLLayout class >> annotation [

	<MSEClass: #Layout super: #CSNOriginedEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #meta }
CSNLLayout class >> requirements [

	<generated>
	^ { CSNContainer }
]

{ #category : #adding }
CSNLLayout >> addCell: anObject [
			
	<generated>
	^ self cell add: anObject
]

{ #category : #accessing }
CSNLLayout >> belongsTo [

	<generated>
	^ self container

]

{ #category : #accessing }
CSNLLayout >> belongsTo: anObject [

	<generated>
	self container: anObject

]

{ #category : #accessing }
CSNLLayout >> cell [

	<generated>
	^ cell
]

{ #category : #accessing }
CSNLLayout >> cell: anObject [

	<generated>
	cell value: anObject

]

{ #category : #navigation }
CSNLLayout >> cellGroup [

	<generated>
	<navigation: 'Cell'>
	^ MooseGroup
			withAll: (self cell asSet)
]

{ #category : #accessing }
CSNLLayout >> container [

	<generated>
	<container>

	<MSEProperty: #container type: #Object>
	^ self privateState attributeAt: #container ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNLLayout >> container: anObject [

	<generated>
	(self privateState attributeAt: #container ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self container.
		self privateState attributeAt: #container put: anObject.
		otherSide layout: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #container put: anObject.
		anObject layout: self ]
]

{ #category : #navigation }
CSNLLayout >> containerGroup [

	<generated>
	<navigation: 'Container'>
	^ MooseGroup
			with: (self container)
]
