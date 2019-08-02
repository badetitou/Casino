Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNBusinessPage >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNBusinessPage: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNBusinessPage >> container [
	^ self pageContainers ifNotEmpty: [ self pageContainers at: 1] ifEmpty:  [ self widgetContainer ifNil: [ self cellOwner ] ]
]

{ #category : #'*Casino-Model-Exporter' }
CSNBusinessPage >> containers [
	^ self pageContainers ifNotEmpty: [ self pageContainers ] ifEmpty: [ {super container} ]
]
