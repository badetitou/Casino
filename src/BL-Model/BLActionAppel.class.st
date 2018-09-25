Class {
	#name : #BLActionAppel,
	#superclass : #BLAction,
	#instVars : [
		'#call => FMOne type: #BLPage opposite: #actions'
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
	^ #()
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
