Class {
	#name : #BLSlider,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLSlider class >> annotation [
	<MSEClass: #BLSlider super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLSlider >> getExternalDependency [
	^ {PNGSlider}
]

{ #category : #'as yet unclassified' }
BLSlider >> getSelector [
	^ 'p-slider'
]
