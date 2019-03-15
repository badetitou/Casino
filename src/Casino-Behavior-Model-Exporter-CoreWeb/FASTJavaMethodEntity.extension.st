Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
FASTJavaMethodEntity >> uniqueName [
	^  self famix ifNotNil: [ :famixMethod | famixMethod uniqueName ] ifNil: [ self name, self mooseID asString ]
]
