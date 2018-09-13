Class {
	#name : #BLUIFieldsetDynamic,
	#superclass : #BLUIPanel,
	#category : #'BL-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
BLUIFieldsetDynamic class >> annotation [
	<MSEClass: #BLUIFieldsetDynamic super: #BLUIPanel>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUIFieldsetDynamic >> accept: anExporter [
	^ anExporter visitBLUIFieldsetDynamic: self
]
