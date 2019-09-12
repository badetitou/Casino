Class {
	#name : #CSNActionAppel,
	#superclass : #CSNAction,
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
	"Relation named: #call type: #CSNPage opposite: #caller"

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
	^ MooseGroup with: self call
]
