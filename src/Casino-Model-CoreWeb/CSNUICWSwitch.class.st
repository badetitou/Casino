Class {
	#name : #CSNUICWSwitch,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWSwitch class >> annotation [

	<FMClass: #Switch super: #CSNUIInput>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWSwitch >> angularComponent [
	^ PNGInputSwitch
]

{ #category : #'as yet unclassified' }
CSNUICWSwitch >> getSelector [
	^ 'p-inputSwitch'
]
