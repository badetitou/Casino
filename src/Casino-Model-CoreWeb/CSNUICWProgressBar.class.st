Class {
	#name : #CSNUICWProgressBar,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWProgressBar class >> annotation [

	<MSEClass: #ProgressBar super: #CSNContainer>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWProgressBar >> getExternalDependency [
	^ {PNGProgressBar}
]

{ #category : #'as yet unclassified' }
CSNUICWProgressBar >> getSelector [
	^ 'p-progressBar'
]
