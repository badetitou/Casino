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
	^ { CSNPage }
]

{ #category : #accessing }
CSNActionAppel >> belongsTo [

	<generated>
	^ self call

]

{ #category : #accessing }
CSNActionAppel >> belongsTo: anObject [

	<generated>
	self call: anObject

]

{ #category : #accessing }
CSNActionAppel >> call [

	<generated>
	<container>

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
