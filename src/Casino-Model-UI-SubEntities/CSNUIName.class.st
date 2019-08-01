Class {
	#name : #CSNUIName,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIName class >> annotation [

	<MSEClass: #Name super: #CSNAttribute>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIName >> accept: anExporter [
	^ anExporter visitUIName: self
]
