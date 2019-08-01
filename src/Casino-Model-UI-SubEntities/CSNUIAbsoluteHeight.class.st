Class {
	#name : #CSNUIAbsoluteHeight,
	#superclass : #CSNUIHeight,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIAbsoluteHeight class >> annotation [

	<MSEClass: #AbsoluteHeight super: #CSNUIHeight>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIAbsoluteHeight >> accept: anExporter [
	^ anExporter visitUIAbsoluteHeight: self
]
