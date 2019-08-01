Extension { #name : #CSNLeaf }

{ #category : #'*Casino-Model-Exporter' }
CSNLeaf >> accept: anExporter [
	^ anExporter visitUILeaf: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNLeaf >> computeSelfAttributes [
	^ super computeSelfAttributes reject: [ :attribute | attribute isOfType: CSNUILabel ]
]
