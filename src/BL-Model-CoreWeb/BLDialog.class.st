Class {
	#name : #BLDialog,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLDialog class >> annotation [
	<MSEClass: #BLDialog super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLDialog >> getExternalDependency [
	^ {PNGDialog}
]

{ #category : #'as yet unclassified' }
BLDialog >> getSelector [
	^ 'p-dialog'
]
