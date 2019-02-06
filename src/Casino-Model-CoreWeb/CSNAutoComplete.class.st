Class {
	#name : #CSNAutoComplete,
	#superclass : #CSNInput,
	#category : #'Casino-Model-CoreWeb-Widget'
}

{ #category : #meta }
CSNAutoComplete class >> annotation [
	<MSEClass: #CSNAutoComplete super: #CSNWidget>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #accessing }
CSNAutoComplete >> getExternalDependency [
	^ {PNGAutoComplete}
]

{ #category : #accessing }
CSNAutoComplete >> getSelector [
	^ 'p-autoComplete'
]
