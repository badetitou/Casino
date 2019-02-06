Class {
	#name : #CSNLayout,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#cell => FMMany type: #CSNCell opposite: #layoutOwner',
		'#container => FMOne type: #CSNUIContainer opposite: #layout'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNLayout class >> annotation [

	<MSEClass: #Layout super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNLayout class >> generatedSlotNames [
	<generated>
	'CSNLayout class>>#generatedSlotNames'.
	^ #(cell container)
]

{ #category : #generator }
CSNLayout class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNLayout class >> requirements [

	<generated>
	^ { CSNUIContainer }
]

{ #category : #accessing }
CSNLayout >> belongsTo [

	<generated>
	^ self container

]

{ #category : #accessing }
CSNLayout >> belongsTo: anObject [

	<generated>
	self container: anObject

]

{ #category : #accessing }
CSNLayout >> cell [

	<generated>
	^ cell
]

{ #category : #accessing }
CSNLayout >> cell: anObject [

	<generated>
	cell value: anObject

]

{ #category : #navigation }
CSNLayout >> cellGroup [

	<generated>
	<navigation: 'Cell'>
	^ MooseGroup
			withAll: (self cell asSet)
]

{ #category : #accessing }
CSNLayout >> container [

	<generated>
	<container>

	^ container
]

{ #category : #accessing }
CSNLayout >> container: anObject [

	<generated>
	container := anObject

]

{ #category : #navigation }
CSNLayout >> containerGroup [

	<generated>
	<navigation: 'Container'>
	^ MooseGroup
			with: (self container)
]
