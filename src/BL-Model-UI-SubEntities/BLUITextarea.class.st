Class {
	#name : #BLUITextarea,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUITextarea class >> annotation [
	<MSEClass: #BLUITextarea super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUITextarea >> accept: anExporter [
	^ anExporter visitBLUITextarea: self
]
