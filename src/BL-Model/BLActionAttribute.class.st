Class {
	#name : #BLActionAttribute,
	#superclass : #BLAttribute,
	#instVars : [
		'#behaviors => FMMany type: #BLBehavior opposite: #actionAttributes',
		'#codeMetierModel'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLActionAttribute class >> annotation [

	<MSEClass: #ActionAttribute super: #BLAttribute>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLActionAttribute class >> generatedSlotNames [
	<generated>
	'BLActionAttribute class>>#generatedSlotNames'.
	^ #(codeMetierModel behaviors)
]

{ #category : #generator }
BLActionAttribute class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLActionAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLActionAttribute >> behaviors [

	<generated>
	^ behaviors
]

{ #category : #accessing }
BLActionAttribute >> behaviors: anObject [

	<generated>
	behaviors value: anObject

]

{ #category : #navigation }
BLActionAttribute >> behaviorsGroup [

	<generated>
	<navigation: 'Behaviors'>
	^ MooseGroup
			withAll: (self behaviors asSet)
]

{ #category : #accessing }
BLActionAttribute >> codeMetierModel [

	<MSEProperty: #codeMetierModel type: #Object>
	<generated>
	<MSEComment: 'The source code of the actions'>
	^ codeMetierModel
]

{ #category : #accessing }
BLActionAttribute >> codeMetierModel: anObject [

	<generated>
	codeMetierModel := anObject

]
