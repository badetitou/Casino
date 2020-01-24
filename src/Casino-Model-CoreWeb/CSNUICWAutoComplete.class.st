Class {
	#name : #CSNUICWAutoComplete,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWAutoComplete class >> annotation [

	<FMClass: #AutoComplete super: #CSNUIInput>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWAutoComplete >> angularComponent [
	^ PNGAutoComplete
]
