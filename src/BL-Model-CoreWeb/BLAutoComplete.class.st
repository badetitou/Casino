Class {
	#name : #BLAutoComplete,
	#superclass : #BLInput,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLAutoComplete class >> annotation [
	<MSEClass: #BLAutoComplete super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLAutoComplete >> getExternalDependency [
	^ {PNGAutoComplete}
]

{ #category : #accessing }
BLAutoComplete >> getSelector [
	^ 'p-autoComplete'
]
