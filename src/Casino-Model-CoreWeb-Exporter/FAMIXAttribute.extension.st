Extension { #name : #FAMIXAttribute }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXAttribute >> shortName [
	^ self name
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXAttribute >> uniqueName [
	^ self shortName, self mooseID asString 
]
