Class {
	#name : #CSNUICanvas,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUICanvas class >> annotation [

	<MSEClass: #Canvas super: #CSNContainer>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #visiting }
CSNUICanvas >> accept: anExporter [
	^ anExporter visitUICanvas: self
]
