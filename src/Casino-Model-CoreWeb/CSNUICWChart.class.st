Class {
	#name : #CSNUICWChart,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWChart class >> annotation [

	<FMClass: #Chart super: #CSNContainer>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWChart >> getExternalDependency [
	^ {PNGChart}
]

{ #category : #'as yet unclassified' }
CSNUICWChart >> getSelector [
	^ 'p-chart'
]
