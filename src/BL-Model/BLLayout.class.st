Class {
	#name : #BLLayout,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#cell => FMMany type: #BLCell opposite: #layoutOwner',
		'#container => FMOne type: #BLUIContainer opposite: #layout'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLLayout class >> annotation [

	<MSEClass: #Layout super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLLayout class >> generatedSlotNames [
	<generated>
	'BLLayout class>>#generatedSlotNames'.
	^ #(cell container)
]

{ #category : #generator }
BLLayout class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLLayout class >> requirements [

	<generated>
	^ { BLUIContainer }
]

{ #category : #accessing }
BLLayout >> cell [

	<generated>
	^ cell
]

{ #category : #accessing }
BLLayout >> cell: anObject [

	<generated>
	cell value: anObject

]

{ #category : #navigation }
BLLayout >> cellGroup [

	<generated>
	<navigation: 'Cell'>
	^ MooseGroup
			withAll: (self cell asSet)
]

{ #category : #accessing }
BLLayout >> container [

	<generated>
	<container>

	^ container
]

{ #category : #accessing }
BLLayout >> container: anObject [

	<generated>
	container := anObject

]

{ #category : #navigation }
BLLayout >> containerGroup [

	<generated>
	<navigation: 'Container'>
	^ MooseGroup
			with: (self container)
]
