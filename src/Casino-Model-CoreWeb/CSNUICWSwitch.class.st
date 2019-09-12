Class {
	#name : #CSNUICWSwitch,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWSwitch class >> annotation [

	<MSEClass: #Switch super: #CSNUIInput>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWSwitch >> getExternalDependency [
	^ {PNGInputSwitch}
]

{ #category : #'as yet unclassified' }
CSNUICWSwitch >> getSelector [
	^ 'p-inputSwitch'
]
