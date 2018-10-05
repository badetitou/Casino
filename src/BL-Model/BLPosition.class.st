Class {
	#name : #BLPosition,
	#superclass : #MooseEntity,
	#instVars : [
		'#widget => FMOne type: #BLWidget opposite: #position'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLPosition class >> annotation [

	<MSEClass: #Position super: #MooseEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLPosition class >> generatedSlotNames [
	<generated>
	'BLPosition class>>#generatedSlotNames'.
	^ #(widget)
]

{ #category : #generator }
BLPosition class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLPosition class >> metamodel [

	<generated>
	^ (self class environment at: #BLLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
BLPosition class >> requirements [

	<generated>
	^ { BLWidget }
]

{ #category : #testing }
BLPosition >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
BLPosition >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
BLPosition >> widget [

	<generated>
	<container>

	^ widget
]

{ #category : #accessing }
BLPosition >> widget: anObject [

	<generated>
	widget := anObject

]

{ #category : #navigation }
BLPosition >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
