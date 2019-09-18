Class {
	#name : #CSNUICWLightFieldset,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWLightFieldset class >> annotation [

	<MSEClass: #LightFieldset super: #CSNAttribute>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUICWLightFieldset >> attributeValue [
	^ 'true'
]

{ #category : #accessing }
CSNUICWLightFieldset >> name [
	^ 'light'
]
