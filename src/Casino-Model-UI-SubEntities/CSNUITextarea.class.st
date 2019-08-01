Class {
	#name : #CSNUITextarea,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUITextarea class >> annotation [

	<MSEClass: #Textarea super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUITextarea >> accept: anExporter [
	^ anExporter visitUITextarea: self
]
