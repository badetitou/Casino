Extension { #name : #BLBusinessPage }

{ #category : #'*BL-Model-Exporter' }
BLBusinessPage >> accept: anExporter [
	^ anExporter visitBLPageMetier: self
]

{ #category : #'*BL-Model-Exporter' }
BLBusinessPage >> container [
	^ self pageContainers ifNotEmpty: [ self pageContainers at: 1] ifEmpty:  [ self widgetContainer ]
]
