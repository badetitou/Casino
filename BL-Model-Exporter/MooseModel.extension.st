Extension { #name : #MooseModel }

{ #category : #'*BL-Model-Exporter' }
MooseModel >> prepareAcceptFor: anExporter [
	"can be override"
]

{ #category : #'*BL-Model-Exporter' }
MooseModel >> visitSuccessorWith: anExporter [
	self allBLPhase do: [ :phase | anExporter visit: phase ]
]

{ #category : #'*BL-Model-Exporter' }
MooseModel >> writeCodeWith: anExporter [
	"can be override"
]
