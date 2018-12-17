Class {
	#name : #BLProgressBar,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLProgressBar class >> annotation [
	<MSEClass: #BLProgressBar super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLProgressBar >> getExternalDependency [
	^ {PNGProgressBar}
]

{ #category : #'as yet unclassified' }
BLProgressBar >> getSelector [
	^ 'p-progressBar'
]
