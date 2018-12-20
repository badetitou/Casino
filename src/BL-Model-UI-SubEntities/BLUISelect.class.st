Class {
	#name : #BLUISelect,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUISelect class >> annotation [
	<MSEClass: #BLUISelect super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #visiting }
BLUISelect >> accept: anExporter [
	^ anExporter visitBLUISelect: self
]
