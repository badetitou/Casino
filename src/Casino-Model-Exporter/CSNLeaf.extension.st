Extension { #name : #CSNLeaf }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNLeaf >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNLeaf: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNLeaf >> computeSelfAttributes [
	^ super computeSelfAttributes reject: [ :attribute | attribute isOfType: CSNUILabel ]
]
