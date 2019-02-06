Class {
	#name : #CSNDialog,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-CoreWeb-Widget'
}

{ #category : #meta }
CSNDialog class >> annotation [
	<MSEClass: #CSNDialog super: #CSNWidget>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #accessing }
CSNDialog >> getExternalDependency [
	^ {PNGDialog}
]

{ #category : #'as yet unclassified' }
CSNDialog >> getSelector [
	^ 'p-dialog'
]
