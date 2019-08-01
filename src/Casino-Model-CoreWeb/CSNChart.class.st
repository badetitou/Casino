Class {
	#name : #CSNChart,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-CoreWeb-Widget'
}

{ #category : #meta }
CSNChart class >> annotation [
	<MSEClass: #BLFileUpload super: #CSNWidget>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #accessing }
CSNChart >> getExternalDependency [
	^ {PNGChart}
]

{ #category : #accessing }
CSNChart >> getSelector [
	^ 'p-chart'
]
