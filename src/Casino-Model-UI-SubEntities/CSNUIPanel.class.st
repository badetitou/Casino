Class {
	#name : #CSNUIPanel,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
CSNUIPanel class >> annotation [
	<MSEClass: #CSNUIPanel super: #CSNUIContainer>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #visiting }
CSNUIPanel >> accept: anExporter [
	^ anExporter visitUIPanel: self
]
