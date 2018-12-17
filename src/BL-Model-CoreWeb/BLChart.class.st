Class {
	#name : #BLChart,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLChart class >> annotation [
	<MSEClass: #BLFileUpload super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLChart >> getExternalDependency [
	^ {PNGChart}
]

{ #category : #accessing }
BLChart >> getSelector [
	^ 'p-chart'
]
