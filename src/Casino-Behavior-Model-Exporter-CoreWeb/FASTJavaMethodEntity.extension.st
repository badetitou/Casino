Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
FASTJavaMethodEntity >> uniqueNameInPage: aPage [
	^  self famix ifNotNil: [ :famixMethod | famixMethod uniqueNameInPage: aPage ] ifNil: [ self name, self mooseID asString ]
]
