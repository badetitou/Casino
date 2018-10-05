Class {
	#name : #BLCell,
	#superclass : #MooseEntity,
	#instVars : [
		'#layoutOwner => FMOne type: #BLLayout opposite: #cell'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLCell class >> annotation [

	<MSEClass: #Cell super: #MooseEntity>
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
BLCell class >> metamodel [

	<generated>
	^ (self class environment at: #BLLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
BLCell class >> requirements [

	<generated>
	^ { BLLayout }
]

{ #category : #testing }
BLCell >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
BLCell >> isType [

	<generated>
	^ false
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
