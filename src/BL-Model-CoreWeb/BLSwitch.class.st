Class {
	#name : #BLSwitch,
	#superclass : #BLInput,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLSwitch class >> annotation [
	<MSEClass: #BLSwitch super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLSwitch >> getExternalDependency [
	^ {PNGInputSwitch}
]

{ #category : #accessing }
BLSwitch >> getSelector [
	^ 'p-inputSwitch'
]
