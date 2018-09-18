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

{ #category : #accesing }
BLUIGrid >> atLevel: level [
	^ self widgets select: [ :position | (position at: 1) = level ]
]

{ #category : #accesing }
BLUIGrid >> maxLevel [
	^ (self widgets collect: [:assoc | assoc key]) max
	
]
