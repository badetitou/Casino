Class {
	#name : #BLUIFieldset,
	#superclass : #BLUIPanel,
	#category : #'BL-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
BLUIFieldset class >> annotation [
	<MSEClass: #BLUIFieldset super: #BLUIPanel>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUIFieldset >> accept: anExporter [
	^ anExporter visitBLUIFieldset: self
]
