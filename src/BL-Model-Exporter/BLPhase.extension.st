Extension { #name : #BLPhase }

{ #category : #'*BL-Model-Exporter' }
BLPhase >> accept: anExporter [
	anExporter visitBLPhase: self
]

{ #category : #'*BL-Model-Exporter' }
BLPhase >> visitSuccessorWith: anExporter [
	"to override"

	self pageMetiers do: [ :metier | anExporter visit: metier ]
]
