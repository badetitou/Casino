Extension { #name : #CSNUILeaf }

{ #category : #'*Casino-Model-Exporter' }
CSNUILeaf >> accept: anExporter [
	^ anExporter visitUILeaf: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNUILeaf >> computeSelfAttributes [
	^ super computeSelfAttributes reject: [ :attribute | attribute isKindOf: CSNUILabel ]
]
