Class {
	#name : #BLUIList,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIList class >> annotation [
	<MSEClass: #BLUIList super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIList >> accept: anExporter [
	^ anExporter visitBLUIList: self
]
