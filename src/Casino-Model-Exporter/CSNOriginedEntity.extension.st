Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Exporter' }
CSNOriginedEntity >> accept: anExporter [
	^ anExporter visitBLOriginedEntity: self 

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
