Class {
	#name : #BLCell,
	#superclass : #BLUIContainer,
	#instVars : [
		'#layoutOwner => FMOne type: #BLLayout opposite: #cell'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLCell class >> annotation [

	<MSEClass: #Cell super: #BLUIContainer>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLCell class >> generatedSlotNames [
	<generated>
	'BLCell class>>#generatedSlotNames'.
	^ #(layoutOwner)
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
