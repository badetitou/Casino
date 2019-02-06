Class {
	#name : #CSNSwitch,
	#superclass : #CSNInput,
	#category : #'Casino-Model-CoreWeb-Widget'
}

{ #category : #meta }
CSNSwitch class >> annotation [
	<MSEClass: #CSNSwitch super: #CSNWidget>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #accessing }
CSNSwitch >> getExternalDependency [
	^ {PNGInputSwitch}
]

{ #category : #accessing }
CSNSwitch >> getSelector [
	^ 'p-inputSwitch'
]
