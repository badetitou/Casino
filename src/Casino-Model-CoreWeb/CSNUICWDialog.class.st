Class {
	#name : #CSNUICWDialog,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWDialog class >> annotation [

	<FMClass: #Dialog super: #CSNContainer>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWDialog >> angularComponent [
	^ PNGDialog
]
