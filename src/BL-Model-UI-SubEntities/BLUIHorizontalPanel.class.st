Class {
	#name : #BLUIHorizontalPanel,
	#superclass : #BLUIPanel,
	#category : #'BL-Model-UI-SubEntities-Panel'
}

{ #category : #meta }
BLUIHorizontalPanel class >> annotation [
	<MSEClass: #BLUIHorizontalPanel super: #BLUIPanel>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHorizontalPanel class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newRow:(Object)'
]

{ #category : #visiting }
BLUIHorizontalPanel >> accept: anExporter [
	^ anExporter visitBLUIHorizontalPanel: self
]
