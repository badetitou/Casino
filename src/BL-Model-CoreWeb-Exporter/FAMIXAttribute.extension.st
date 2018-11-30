Extension { #name : #FAMIXAttribute }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
FAMIXAttribute >> shortName [
	^ self name
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
FAMIXAttribute >> uniqueName [
	^ self shortName, self mooseID asString 
]
