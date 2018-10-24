Class {
	#name : #BLUISelect,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUISelect class >> annotation [
	<MSEClass: #BLUISelect super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUISelect >> accept: anExporter [
	^ anExporter visitBLUISelect: self
]
