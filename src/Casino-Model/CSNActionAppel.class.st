Class {
	#name : #CSNActionAppel,
	#superclass : #CSNAction,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#call => FMOne type: #CSNPage opposite: #caller'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNActionAppel class >> annotation [

	<MSEClass: #ActionAppel super: #CSNAction>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNActionAppel class >> generatedSlotNames [
	<generated>
	'CSNActionAppel class>>#generatedSlotNames'.
	^ #(call)
]

{ #category : #generator }
CSNActionAppel class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation)
]

{ #category : #meta }
CSNActionAppel class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNActionAppel >> call [

	<generated>
	^ call
]

{ #category : #accessing }
CSNActionAppel >> call: anObject [

	<generated>
	call := anObject

]

{ #category : #navigation }
CSNActionAppel >> callGroup [

	<generated>
	<navigation: 'Call'>
	^ MooseGroup
			with: (self call)
]
