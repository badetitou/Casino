Class {
	#name : #CSNUIFieldset,
	#superclass : #CSNUIPanel,
	#category : #'Casino-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
CSNUIFieldset class >> annotation [

	<MSEClass: #Fieldset super: #CSNUIPanel>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #visiting }
CSNUIFieldset >> accept: anExporter [
	^ anExporter visitUIFieldset: self
]
