Class {
	#name : #BLTable,
	#superclass : #BLUIContainer,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLTable class >> annotation [
	<MSEClass: #BLTable super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLTable >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #accessing }
BLTable >> getExternalDependency [
	^ {PNGTurboTable}
]

{ #category : #'as yet unclassified' }
BLTable >> getSelector [
	^ 'p-table'
]
