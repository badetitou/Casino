Extension { #name : #BLUIFieldsetDynamic }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIFieldsetDynamic >> getExternalDependency [
	^ {PNGFieldset}
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIFieldsetDynamic >> getSelector [
	^ 'bl-fieldset'
]
