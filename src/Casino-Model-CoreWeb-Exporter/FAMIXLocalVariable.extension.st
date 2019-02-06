Extension { #name : #FAMIXLocalVariable }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXLocalVariable >> shortName [
	^ self name 
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXLocalVariable >> uniqueName [
	^ self shortName, self mooseID asString 
]
