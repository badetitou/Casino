Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNOriginedEntity >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNOriginedEntity: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNOriginedEntity >> prepareAcceptFor: anExporter [
	"to override"
]

{ #category : #'*Casino-Model-Exporter' }
CSNOriginedEntity >> visitSuccessorWith: anExporter [
	"to override"

]

{ #category : #'*Casino-Model-Exporter' }
CSNOriginedEntity >> writeCodeWith: anExporter [
	"to override"

]
