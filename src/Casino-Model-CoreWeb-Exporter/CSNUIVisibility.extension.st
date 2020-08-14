Extension { #name : #CSNUIVisibility }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIVisibility >> attributeValue [
	^ '' , self variableName , ''
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIVisibility >> name [
	^ 'hidden'
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIVisibility >> variableName [
	^ 'hide', self widget id
]
