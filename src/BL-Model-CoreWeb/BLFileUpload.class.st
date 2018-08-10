Class {
	#name : #BLFileUpload,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLFileUpload class >> annotation [
	<MSEClass: #BLFileUpload super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLFileUpload >> getExternalDependency [
	^ {PNGFileUpload}
]

{ #category : #accessing }
BLFileUpload >> getSelector [
	^ 'p-fileUpload'
]
