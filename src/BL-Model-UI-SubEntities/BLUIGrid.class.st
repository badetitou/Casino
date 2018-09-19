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
	^ (self privateState attributeAt: #widgetPosition ifAbsentPut: [ Dictionary new ]) select: [ :position | (position at: 1) = level ]
]

{ #category : #accesing }
BLUIGrid >> maxLevel [
	^ (((self privateState attributeAt: #widgetPosition ifAbsentPut: [ Dictionary new ]) collect: [:coord | coord at: 1]) ifEmpty: [ ^ 0 ] ifNotEmpty: [:col | col max])
	
]
