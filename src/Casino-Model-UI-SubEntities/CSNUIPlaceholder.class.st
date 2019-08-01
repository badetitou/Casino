Class {
	#name : #CSNUIPlaceholder,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIPlaceholder class >> annotation [

	<MSEClass: #Placeholder super: #CSNAttribute>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIPlaceholder >> accept: anExporter [
	^ anExporter visitUIPlaceholder: self
]
