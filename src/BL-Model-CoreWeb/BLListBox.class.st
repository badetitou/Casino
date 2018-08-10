Class {
	#name : #BLListBox,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLListBox class >> annotation [
	<MSEClass: #BLListBox super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLListBox >> getExternalDependency [
	^ {PNGListbox}
]

{ #category : #'as yet unclassified' }
BLListBox >> getSelector [
	^ 'p-listbox'
]
