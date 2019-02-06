Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Exporter' }
CSNPage >> accept: anExporter [
	^ anExporter visitBLPage: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNPage >> hasMultiplePageMetier [
	^ self businessPage size > 1
]

{ #category : #'*Casino-Model-Exporter' }
CSNPage >> hasNoPageMetier [
	^ self businessPage isEmpty 
]

{ #category : #'*Casino-Model-Exporter' }
CSNPage >> visitSuccessorWith: anExporter [
	"to override"

	self businessPage do: [ :metier | anExporter visit: metier ]
]
