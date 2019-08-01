Class {
	#name : #CSNUIPanel,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
CSNUIPanel class >> annotation [

	<MSEClass: #Panel super: #CSNContainer>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #visiting }
CSNUIPanel >> accept: anExporter [
	^ anExporter visitUIPanel: self
]
