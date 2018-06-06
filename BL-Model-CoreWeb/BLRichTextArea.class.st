Class {
	#name : #BLRichTextArea,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLRichTextArea class >> annotation [
	<MSEClass: #BLRichTextArea super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLRichTextArea >> getExternalDependency [
	^ {PNGEditor}
]

{ #category : #'as yet unclassified' }
BLRichTextArea >> getSelector [
	^ 'p-editor'
]
