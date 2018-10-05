Class {
	#name : #BLUIImage,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIImage class >> annotation [
	<MSEClass: #BLUIImage super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIImage >> accept: anExporter [
	^ anExporter visitBLUIImage: self
]
