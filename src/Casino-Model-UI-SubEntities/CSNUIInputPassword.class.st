Class {
	#name : #CSNUIInputPassword,
	#superclass : #CSNUIInputText,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputPassword class >> annotation [

	<MSEClass: #InputPassword super: #CSNUIInputText>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputPassword >> accept: anExporter [
	^ anExporter visitUIInputPassword: self
]
