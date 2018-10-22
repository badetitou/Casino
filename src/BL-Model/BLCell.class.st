Class {
	#name : #BLCell,
	#superclass : #BLWidget,
	#instVars : [
		'#layoutOwner => FMOne type: #BLLayout opposite: #cell',
		'#widget => FMOne type: #BLWidget opposite: #cellOwner'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLCell class >> annotation [

	<MSEClass: #Cell super: #BLWidget>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLCell class >> generatedSlotNames [
	<generated>
	'BLCell class>>#generatedSlotNames'.
	^ #(layoutOwner widget)
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

{ #category : #accessing }
BLCell >> widget [

	<generated>
	^ widget
]

{ #category : #accessing }
BLCell >> widget: anObject [

	<generated>
	widget := anObject

]

{ #category : #navigation }
BLCell >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
