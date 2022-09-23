Class {
	#name : #CSNModelServiceExporter,
	#superclass : #Object,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #'as yet unclassified' }
CSNModelServiceExporter >> getLocalPathOf: aService [
	^ aService getLocalPath
]
