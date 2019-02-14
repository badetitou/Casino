Extension { #name : #MooseModel }

{ #category : #'*Casino-Model-Exporter' }
MooseModel >> accept: anExporter [
	anExporter visitMooseModel: self
]

{ #category : #'*Casino-Model-Exporter' }
MooseModel >> prepareAcceptFor: anExporter [
	"can be override"
]

{ #category : #'*Casino-Model-Exporter' }
MooseModel >> visitSuccessorWith: anExporter [
	self allCSNPage do: [ :phase | anExporter visit: phase ]
]

{ #category : #'*Casino-Model-Exporter' }
MooseModel >> writeCodeWith: anExporter [
	"can be override"
]
