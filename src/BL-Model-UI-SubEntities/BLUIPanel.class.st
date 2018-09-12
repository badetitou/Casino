Class {
	#name : #BLUIPanel,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
BLUIPanel class >> annotation [
	<MSEClass: #BLUIPanel super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUIPanel >> accept: anExporter [
	^ anExporter visitBLUIPanel: self
]
