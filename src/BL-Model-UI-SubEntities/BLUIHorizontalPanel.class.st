Class {
	#name : #BLUIHorizontalPanel,
	#superclass : #BLUIPanel,
	#category : #'BL-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
BLUIHorizontalPanel class >> annotation [
	<MSEClass: #BLUIHorizontalPanel super: #BLUIPanel>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUIHorizontalPanel >> accept: anExporter [
	^ anExporter visitBLUIHorizontalPanel: self
]
