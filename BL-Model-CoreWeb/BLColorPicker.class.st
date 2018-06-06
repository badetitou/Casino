Class {
	#name : #BLColorPicker,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLColorPicker class >> annotation [
	<MSEClass: #BLColorPicker super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLColorPicker >> getExternalDependency [
	^ {PNGColorPicker}
]

{ #category : #'as yet unclassified' }
BLColorPicker >> getSelector [
	^ 'p-colorPicker'
]
