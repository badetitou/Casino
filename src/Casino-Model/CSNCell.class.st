Class {
	#name : #CSNCell,
	#superclass : #CSNWidget,
	#instVars : [
		'#layoutOwner => FMOne type: #CSNLayout opposite: #cell',
		'#widget => FMOne type: #CSNWidget opposite: #cellOwner'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNCell class >> annotation [

	<MSEClass: #Cell super: #CSNWidget>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNCell class >> generatedSlotNames [
	<generated>
	'CSNCell class>>#generatedSlotNames'.
	^ #(layoutOwner widget)
]

{ #category : #generator }
CSNCell class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNCell class >> requirements [

	<generated>
	^ { CSNLayout }
]

{ #category : #accessing }
CSNCell >> belongsTo [

	<generated>
	^ self layoutOwner

]

{ #category : #accessing }
CSNCell >> belongsTo: anObject [

	<generated>
	self layoutOwner: anObject

]

{ #category : #accessing }
CSNCell >> layoutOwner [

	<generated>
	<container>

	^ layoutOwner
]

{ #category : #accessing }
CSNCell >> layoutOwner: anObject [

	<generated>
	layoutOwner := anObject

]

{ #category : #navigation }
CSNCell >> layoutOwnerGroup [

	<generated>
	<navigation: 'LayoutOwner'>
	^ MooseGroup
			with: (self layoutOwner)
]

{ #category : #accessing }
CSNCell >> widget [

	<generated>
	^ widget
]

{ #category : #accessing }
CSNCell >> widget: anObject [

	<generated>
	widget := anObject

]

{ #category : #navigation }
CSNCell >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
