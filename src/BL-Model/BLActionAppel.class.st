Class {
	#name : #BLActionAppel,
	#superclass : #BLAction,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#call => FMOne type: #BLPage opposite: #caller'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLActionAppel class >> annotation [

	<MSEClass: #ActionAppel super: #BLAction>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLActionAppel class >> generatedSlotNames [
	<generated>
	'BLActionAppel class>>#generatedSlotNames'.
	^ #(call)
]

{ #category : #generator }
BLActionAppel class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation)
]

{ #category : #meta }
BLActionAppel class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLActionAppel >> call [

	<generated>
	^ call
]

{ #category : #accessing }
BLActionAppel >> call: anObject [

	<generated>
	call := anObject

]

{ #category : #navigation }
BLActionAppel >> callGroup [

	<generated>
	<navigation: 'Call'>
	^ MooseGroup
			with: (self call)
]
