"
I represent an abstract call to a distant service
	
Since I'm abstract, I should not be instanciate (but, it is a reasonnable solution if you don't know witch call instanciate)
"
Class {
	#name : #CSNBCall,
	#superclass : #CSNBExpression,
	#instVars : [
		'distantService',
		'onFailure',
		'onSuccess'
	],
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBCall class >> annotation [

	<MSEClass: #Call super: #CSNBExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBCall class >> generatedSlotNames [
	<generated>
	'CSNBCall class>>#generatedSlotNames'.
	^ #(distantService onFailure onSuccess)
]

{ #category : #generator }
CSNBCall class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBCall class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNBCall >> distantService [

	<MSEProperty: #distantService type: #String>
	<generated>
	<MSEComment: 'The link to service I call'>
	^ distantService
]

{ #category : #accessing }
CSNBCall >> distantService: anObject [

	<generated>
	distantService := anObject

]

{ #category : #accessing }
CSNBCall >> onFailure [

	<MSEProperty: #onFailure type: #CSNBStatement>
	<generated>
	<MSEComment: 'The statement executed if the call return ''ko'''>
	^ onFailure
]

{ #category : #accessing }
CSNBCall >> onFailure: anObject [

	<generated>
	onFailure := anObject

]

{ #category : #accessing }
CSNBCall >> onSuccess [

	<MSEProperty: #onSuccess type: #CSNBStatement>
	<generated>
	<MSEComment: 'The statement executed if the call return ''ok'''>
	^ onSuccess
]

{ #category : #accessing }
CSNBCall >> onSuccess: anObject [

	<generated>
	onSuccess := anObject

]
