Class {
	#name : #CSNUIRelativeWidth,
	#superclass : #CSNUIWidth,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIRelativeWidth class >> annotation [

	<MSEClass: #RelativeWidth super: #CSNUIWidth>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIRelativeWidth >> accept: anExporter [
	^ anExporter visitUIRelativeWidth: self
]
