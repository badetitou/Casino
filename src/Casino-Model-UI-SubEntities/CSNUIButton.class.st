Class {
	#name : #CSNUIButton,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIButton class >> annotation [

	<MSEClass: #Button super: #CSNContainer>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIButton >> accept: anExporter [
	^ anExporter
		visitUIButton: self
]
