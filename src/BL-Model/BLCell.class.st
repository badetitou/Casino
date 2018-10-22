Class {
	#name : #BLCell,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#layout => FMOne type: #BLWidget opposite: #cellOwner',
		'#layoutOwner => FMOne type: #BLLayout opposite: #cell'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLCell class >> annotation [

	<MSEClass: #Cell super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLCell class >> generatedSlotNames [
	<generated>
	'BLCell class>>#generatedSlotNames'.
	^ #(layoutOwner layout)
]

{ #category : #generator }
BLCell class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLCell class >> requirements [

	<generated>
	^ { BLLayout }
]

{ #category : #accessing }
BLCell >> layout [

	<generated>
	^ layout
]

{ #category : #accessing }
BLCell >> layout: anObject [

	<generated>
	layout := anObject

]

{ #category : #navigation }
BLCell >> layoutGroup [

	<generated>
	<navigation: 'Layout'>
	^ MooseGroup
			with: (self layout)
]

{ #category : #accessing }
BLCell >> layoutOwner [

	<generated>
	<container>

	^ layoutOwner
]

{ #category : #accessing }
BLCell >> layoutOwner: anObject [

	<generated>
	layoutOwner := anObject

]

{ #category : #navigation }
BLCell >> layoutOwnerGroup [

	<generated>
	<navigation: 'LayoutOwner'>
	^ MooseGroup
			with: (self layoutOwner)
]
