Extension { #name : #BLOriginedEntity }

{ #category : #'*BL-Model-Exporter' }
BLOriginedEntity >> accept: anExporter [
	anExporter visitBLOriginedEntity: self 

]

{ #category : #'*BL-Model-Exporter' }
BLOriginedEntity >> prepareAcceptFor: anExporter [
	"to override"
]

{ #category : #'*BL-Model-Exporter' }
BLOriginedEntity >> visitSuccessorWith: anExporter [
	"to override"

]

{ #category : #'*BL-Model-Exporter' }
BLOriginedEntity >> writeCodeWith: anExporter [
	"to override"

]
