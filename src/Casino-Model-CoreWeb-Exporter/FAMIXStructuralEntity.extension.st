Extension { #name : #FAMIXStructuralEntity }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
FAMIXStructuralEntity >> uniqueName [
	^ self name, self mooseID asString
]
