Class {
	#name : #CSNUIFieldset,
	#superclass : #CSNUIPanel,
	#category : #'Casino-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
CSNUIFieldset class >> annotation [
	<MSEClass: #CSNUIFieldset super: #CSNUIPanel>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #visiting }
CSNUIFieldset >> accept: anExporter [
	^ anExporter visitBLUIFieldset: self
]
