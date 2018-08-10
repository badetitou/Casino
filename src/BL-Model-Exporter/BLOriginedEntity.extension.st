Extension { #name : #BLOriginedEntity }

{ #category : #'*BL-Model-Exporter' }
BLOriginedEntity >> accept: anExporter [
	anExporter visitBLOriginedEntity: self 

]

{ #category : #'*BL-Model-Exporter' }
BLOriginedEntity >> exportCode [
	"this can be useless but it also can help to follow some rule of programming"
	
	^''

	
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
