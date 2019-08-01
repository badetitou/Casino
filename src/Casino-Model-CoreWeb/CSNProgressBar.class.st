Class {
	#name : #CSNProgressBar,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-CoreWeb-Widget'
}

{ #category : #meta }
CSNProgressBar class >> annotation [
	<MSEClass: #CSNProgressBar super: #CSNWidget>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #accessing }
CSNProgressBar >> getExternalDependency [
	^ {PNGProgressBar}
]

{ #category : #'as yet unclassified' }
CSNProgressBar >> getSelector [
	^ 'p-progressBar'
]
