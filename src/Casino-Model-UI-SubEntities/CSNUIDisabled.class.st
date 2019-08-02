Class {
	#name : #CSNUIDisabled,
	#superclass : #CSNAttribute,
	#instVars : [
		'disabled'
	],
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIDisabled class >> annotation [

	<MSEClass: #Disabled super: #CSNAttribute>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIDisabled >> disabled [
	^ disabled
]

{ #category : #accessing }
CSNUIDisabled >> disabled: anObject [
	disabled := anObject
]
