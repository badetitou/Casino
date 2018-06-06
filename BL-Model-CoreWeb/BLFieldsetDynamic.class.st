Class {
	#name : #BLFieldsetDynamic,
	#superclass : #BLFieldset,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLFieldsetDynamic class >> annotation [
	<MSEClass: #BLFieldsetDynamic super: #BLFieldset>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLFieldsetDynamic >> getSelector [
	^ 'p-fieldset'
]
