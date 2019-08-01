Class {
	#name : #CSNUIWidth,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIWidth class >> annotation [

	<MSEClass: #Width super: #CSNAttribute>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIWidth >> accept: anExporter [
	^ anExporter visitUIWidth: self
]
