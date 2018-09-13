Class {
	#name : #BLUIGrid,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
BLUIGrid class >> annotation [
	<MSEClass: #BLUIGrid super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUIGrid >> accept: anExporter [
	^ anExporter visitBLUIGrid: self
]
