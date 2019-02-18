Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
FASTJavaMethodEntity >> uniqueName [
	^ self name, self mooseID asString 
]
