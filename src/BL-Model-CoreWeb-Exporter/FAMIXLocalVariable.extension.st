Extension { #name : #FAMIXLocalVariable }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
FAMIXLocalVariable >> shortName [
	^ self name 
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
FAMIXLocalVariable >> uniqueName [
	^ self shortName, self mooseID asString 
]
